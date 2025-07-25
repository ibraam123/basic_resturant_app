import 'package:basic_resturant_app/widgets/custom_button.dart';
import 'package:basic_resturant_app/widgets/custom_text_field.dart';
import 'package:basic_resturant_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(size: size, name: "Welcome To My App"),
             SizedBox(height: 30.h),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    labelText: 'Email',
                    controller: authController.emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.h),
                  GetX<AuthController>(
                    builder: (controller) => CustomTextField(
                      labelText: 'Password',
                      controller: controller.passwordController,
                      obscureText: true,
                      showVisibilityToggle: true,
                      isPasswordVisible: controller.isPasswordVisible.value,
                      onToggleVisibility: controller.togglePasswordVisibility,
                    ),
                  ),
                  SizedBox(height: 30.h),
                   CustomButton(
                    onPressed: () {
                      authController.login();
                    },
                    buttonText: "Login",
                    color: Colors.orange,
                  ),
                   SizedBox(height: 20.h),
                   CustomButton(
                    onPressed: () {
                      authController.signup();
                    },
                    buttonText: "Sign Up",
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}