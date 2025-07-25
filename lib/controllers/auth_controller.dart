import 'package:basic_resturant_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart'; // <-- Make sure this path is correct

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final isPasswordVisible = false.obs;
  final isLoading = false.obs;

  final AuthService _authService = AuthService();

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  Future<void> signup() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and Password are required',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true;
      UserCredential? credential = await _authService.signUpWithEmail(email: email, password: password);

      if (credential != null) {
        Get.offAllNamed(HomePage.routeName);
        Get.snackbar('Success', 'Account Created Successfully',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Email and Password are required',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    try {
      isLoading.value = true;
      UserCredential? credential = await _authService.signInWithEmail(email: email, password: password);

      if (credential != null) {
        Get.offAllNamed(HomePage.routeName);
        Get.snackbar('Success', 'Login Successful',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2));
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await _authService.signOut();
    Get.snackbar('Logged Out', 'You have been signed out',
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
