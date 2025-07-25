import 'package:basic_resturant_app/pages/cart_page.dart';
import 'package:basic_resturant_app/pages/home_page.dart';
import 'package:basic_resturant_app/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'binding/binding.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Restaurant App",
          initialRoute: LoginPage.routeName,
          initialBinding: ControllersBinding(),
          getPages: [
            GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
            GetPage(name: HomePage.routeName, page: () => const HomePage()),
            GetPage(name: CartPage.routeName, page: () => const CartPage()),
          ],
        );
      },
    );
  }
}
