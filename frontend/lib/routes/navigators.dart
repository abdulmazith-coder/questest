

import 'package:frontend/auth/loginpage.dart';
import 'package:frontend/auth/signuppage.dart';
import 'package:frontend/pages/homepage.dart';
import 'package:frontend/splash/splash.dart';
import 'package:get/get.dart';

class Navigators{
 static const String splash = '/splash';
 static const String signIn = '/signin';
 static const String signUp = '/signup';
 static const String home = '/home';




static final routes=[
  GetPage(name:signIn  , page: () => const LoginPage(),),
  GetPage(name:signUp, page: () => const SignupPage(),),
  GetPage(name:home, page: () => const HomePage(),),
  GetPage(name:splash, page: () => const SplashPage(),)
];
 

}