import 'package:flutter/material.dart';
import 'package:frontend/logic/register/signin_logic.dart';
import 'package:frontend/myapp.dart';
import 'package:get/get.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
   Get.put(SignInLogic());
  runApp(const MyApp());
}


