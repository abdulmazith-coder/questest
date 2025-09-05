import 'package:flutter/material.dart';
import 'package:frontend/extension.dart';
import 'package:frontend/logic/register/signup_logic.dart';
import 'package:frontend/routes/navigators.dart';
import 'package:frontend/theme/colors.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/formtext.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final height = context.screenHeight;
    final controller = Get.put(SignupLogic());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(

          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.signupFormKey,
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
                Text("Sign Up To Your Account.",style:context.headlineMedium!.copyWith(fontWeight: FontWeight.w600) ,),
                 SizedBox(height: height * 0.01),
                 Text("let's create the account to generate the question paper",style:context.bodyLarge!.copyWith(fontWeight: FontWeight.w400,color:ColorsQuestest.gray) ,),


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
                  lableTitle: "Username",
                  controller: controller.username,
                  validator: "Enter your username",
                   obscureText: false,
                    hint: '@username',
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
                    controller.signupValidation();
                  },
                  child: Button(
                      buttonText:"Sign Up",
                  ),
                ),
           SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style:context.bodyLarge!.copyWith(fontWeight: FontWeight.w400,) ,),
                    GestureDetector(
                      
                      onTap:(){Get.offNamedUntil(Navigators.signIn,(routes)=>false);},
                      child: Text("Sign In",style:context.bodyLarge!.copyWith(fontWeight: FontWeight.w400,color:ColorsQuestest.blue) ,)),
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}