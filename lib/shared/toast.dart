import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

void toastSuccess(String title, String subTitle, BuildContext context) {
  MotionToast.success(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          description: Text(subTitle),
          layoutOrientation: ToastOrientation.ltr,
          position: MotionToastPosition.top,
          animationType: AnimationType.fromRight)
      .show(context);
}

void toastFail(String title, String subTitle, BuildContext context) {
  MotionToast.error(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          description: Text(subTitle),
          layoutOrientation: ToastOrientation.ltr,
          position: MotionToastPosition.top,
          animationType: AnimationType.fromRight)
      .show(context);
}

void toastPrimary(String title, String subTitle, BuildContext context) {
  MotionToast.info(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          description: Text(subTitle),
          layoutOrientation: ToastOrientation.ltr,
          position: MotionToastPosition.top,
          animationType: AnimationType.fromRight)
      .show(context);
}

void toastDanger(String title, String subTitle, BuildContext context) {
  MotionToast.warning(
          title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          description: Text(subTitle),
          layoutOrientation: ToastOrientation.ltr,
          position: MotionToastPosition.top,
          animationType: AnimationType.fromRight)
      .show(context);
}
