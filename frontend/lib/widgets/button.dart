import 'package:flutter/material.dart';
import 'package:frontend/extension.dart';
import 'package:frontend/theme/colors.dart';

class Button extends StatelessWidget {
  final String buttonText;
  const Button({super.key, required this.buttonText});
  @override
  Widget build(BuildContext context) {
        final width = context.screenWidth;
    final height = context.screenHeight;
    return Container(
      width:width, 
      height:height*0.07,
      decoration:BoxDecoration(
        color:ColorsQuestest.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(buttonText,style: context.titleMedium!.copyWith(color:ColorsQuestest.white,fontFamily:'Inter',fontSize:20),),
      ),
      );
  }
}