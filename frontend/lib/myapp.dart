import 'package:flutter/material.dart';
import 'package:frontend/auth/loginpage.dart';
import 'package:frontend/routes/navigators.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/theme/texttheme.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'questest',
      theme: ThemeData(
        scaffoldBackgroundColor:ColorsQuestest.white,
       textTheme:QuesTestTheme.textTheme
      ),
     debugShowCheckedModeBanner: false,
      initialRoute:Navigators.splash,
      getPages:Navigators.routes,
    );
  }
}
