import 'package:flutter/material.dart';
import 'package:frontend/extension.dart';
import 'package:frontend/logic/register/signin_logic.dart';
import 'package:frontend/routes/navigators.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/formtext.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final height = context.screenHeight;
    final controller = Get.find<SignInLogic>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage("assets/images/questest.png"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Text("Questest", style: context.titleLarge!.copyWith(fontFamily:'PlusJakartaSans')),
                  ],
                ),

                  SizedBox(height: height * 0.04),
                Text("Sign In To Your Account.",style:context.headlineMedium!.copyWith(fontWeight: FontWeight.w600) ,),
                 SizedBox(height: height * 0.01),
                 Text("let's signin to your account to generate the question paper",style:context.bodyLarge!.copyWith(fontWeight: FontWeight.w400,color:ColorsQuestest.gray) ,),


                SizedBox(height: height * 0.05),
                FormText(
                  lableTitle: "Email Address",
                  controller: controller.email,
                  validator: "Enter your email address",
                   obscureText: false,
                    hint: 'email@gmail.com',
                ),
                SizedBox(height: height * 0.02),
                FormText(
                  lableTitle: "Password",
                  controller: controller.password,
                  validator: "Enter your password",
                   obscureText: true,
                    hint: '********',
                ),

                SizedBox(height: height * 0.05),
                GestureDetector(
                  onTap: (){
                    controller.signInValidation();
                  },
                  child: Button(
                      buttonText:"Sign In",
                  ),
                ),
           SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create an new account?",style:context.bodyLarge!.copyWith(fontWeight: FontWeight.w400,) ,),
                    GestureDetector(
                      onTap:(){
                        Get.offNamedUntil(Navigators.signUp,(routes)=>false);
                      },
                      
                      child: Text("Sign up",style:context.bodyLarge!.copyWith(fontWeight: FontWeight.w400,color:ColorsQuestest.blue) ,)),
                  ],
                ),
                Align(
                  alignment:Alignment.center,
                  child: Text("Forgot Password?",style:context.bodyLarge!.copyWith(fontWeight: FontWeight.w400,color:ColorsQuestest.blue) ,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
