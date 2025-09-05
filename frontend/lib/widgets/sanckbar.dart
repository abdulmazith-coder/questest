

import 'package:get/get.dart';

void snackBar(title, message) {

  GetSnackBar(
    title: "$title",
    message: message,
    duration: const Duration(seconds: 3),
  ).show();
}