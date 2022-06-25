import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technicaltest_danafix/app/utils/enum.dart';

SnackbarController showSnackBar(
    {String? title, String? message, required SnackBarType snackBarType}) {
  switch (snackBarType) {
    case SnackBarType.SUCCESS:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        barBlur: 3,
        icon: const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
        snackStyle: SnackStyle.FLOATING,
      );
    case SnackBarType.ERROR:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        barBlur: 3,
        icon: const Icon(
          Icons.error,
          color: Colors.white,
        ),
        snackStyle: SnackStyle.FLOATING,
      );
    case SnackBarType.INFO:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        barBlur: 3,
        icon: const Icon(
          Icons.info,
          color: Colors.white,
        ),
        snackStyle: SnackStyle.FLOATING,
      );
    case SnackBarType.WARNING:
      return Get.snackbar(
        "$title",
        "$message",
        backgroundColor: Colors.orange,
        colorText: Colors.white,
        barBlur: 3,
        icon: const Icon(
          Icons.warning_rounded,
          color: Colors.white,
        ),
        snackStyle: SnackStyle.FLOATING,
      );

    default:
      return Get.snackbar("$title", "$message");
  }
}
