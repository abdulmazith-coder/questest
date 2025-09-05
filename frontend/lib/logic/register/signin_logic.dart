

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/datasources/userrepository.dart';
import 'package:frontend/routes/navigators.dart';
import 'package:frontend/widgets/sanckbar.dart';
import 'package:get/get.dart';

class SignInLogic extends GetxController{
  final repository = UserRepository();
  final email = TextEditingController();
  final password = TextEditingController();
  var isLoading = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  final secureStorage = FlutterSecureStorage();
  var accessToken = "".obs;
  var refreshToken = "".obs;
  var userId = "".obs;
@override
  void onInit() {
    
    super.onInit();
    readLocaly();
  }


///  -------------   login validation   -------------
  void signInValidation()async{
   if (!loginFormKey.currentState!.validate()) return;

    isLoading.value = true;
    if(email.text.isNotEmpty  || password.text.isNotEmpty){
      final res = await repository.login(
      email: email.text.trim(),
      password: password.text.trim(),
    );
   print("login res $res");
    if(res['message']==true){
      storeLocaly(res);
      isLoading.value = false;
      email.clear();
      password.clear();
      readLocaly();
      snackBar('Success', "Login Successfully");
    }
     isLoading.value = false;
    }else{
      isLoading.value = false;
      snackBar("Error", "All Fields are required");
    }
  }
  




///  -------------   store userdata in localy   -------------
  Future storeLocaly(res)async{
     await secureStorage.write(key: 'accessToken', value: res['access_token']);
     await secureStorage.write(key: 'refreshToken', value: res['refresh_token']);
     await secureStorage.write(key: 'userId', value: res['userid']);
  }





///  -------------   read userdata in localy   -------------

    Future readLocaly()async{
    accessToken.value = await secureStorage.read(key: 'accessToken') ?? '';
    refreshToken.value = await secureStorage.read(key: 'refreshToken') ?? '';
    userId.value = await secureStorage.read(key: 'userId') ?? '';

   if(accessToken.value.isNotEmpty|| refreshToken.value.isNotEmpty || userId.value.isNotEmpty){
    Get.offAllNamed(Navigators.home);
   }else{
    Get.offAllNamed(Navigators.signIn);
   }
  }






///  -------------   restore the refresh token   -------------
  Future expriedToken()async{
   final res = await repository.refreshToken(refershToken: refreshToken.value);
    if(res["error"]=="RefreshToken_required"){ snackBar("Error", "something went wrong , try again later");}
    await secureStorage.delete(key: 'refreshToken');
    await secureStorage.delete(key: 'accessToken');
    await secureStorage.delete(key: 'userId');
    storeLocaly(res);
    readLocaly();
      }

 @override
  void onClose() {
   email.dispose();
   password.dispose();
    super.onClose();
  }

}