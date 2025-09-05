import 'package:flutter/widgets.dart';
import 'package:frontend/datasources/userrepository.dart';
import 'package:frontend/widgets/sanckbar.dart';
import 'package:get/get.dart';

class SignupLogic extends GetxController {

  final repository = UserRepository();
  final email = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  var isLoading = false.obs;
  final signupFormKey = GlobalKey<FormState>();

  Future signupValidation() async {
    if (!signupFormKey.currentState!.validate()) return;

    isLoading.value = true;
    if(email.text.isNotEmpty|| username.text.isNotEmpty || password.text.isNotEmpty){
          final res = await repository.signup(
      email: email.text.trim(),
      username: username.text.trim(),
      password: password.text.trim(),
    );
   print("signup res $res");
    if(res['message']==true){
      isLoading.value = false;
      email.clear();
      username.clear();
      password.clear();
      snackBar('Success', "Account Created Successfully");
    }
     isLoading.value = false;
    }else{
      isLoading.value = false;
      snackBar("Error", "All Fields are required");
    }
  }

  @override
  void onClose() {
    email.dispose();
    username.dispose();
    password.dispose();
    super.onClose();
  }
}
