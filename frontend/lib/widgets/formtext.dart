import 'package:flutter/material.dart';
import 'package:frontend/extension.dart';
import 'package:frontend/theme/colors.dart';


class FormText extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String lableTitle;
  final String hint;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? validator;
  const FormText({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.lableTitle,
    required this.hint,
    this.keyboardType,
    this.maxLines, 
    this.validator, 

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lableTitle, style:context.bodyLarge!.copyWith(fontFamily:'PlusJakartaSans',fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          controller: controller,
          obscureText: obscureText,
          cursorColor: ColorsQuestest.blue,
          style: const TextStyle(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade200,
            hintText: hint,
            hintStyle: const TextStyle(fontWeight: FontWeight.w500),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          validator:(value)=>value!.isEmpty ? validator: null,
        ),

        
      ],
    );
  }
}