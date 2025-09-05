import 'package:flutter/material.dart';
import 'package:frontend/logic/register/signin_logic.dart';
import 'package:get/get.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final signInLogic = Get.find<SignInLogic>();

    // Run check after splash loads
    Future.delayed(const Duration(milliseconds: 500), () {
      signInLogic.readLocaly();
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
