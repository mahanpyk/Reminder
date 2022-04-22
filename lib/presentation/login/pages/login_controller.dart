import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/app/routes/app_routes.dart';
import 'package:reminder/presentation/login/repo/login_repository.dart';

class LoginController extends GetxController {
  LoginController(this._repository);

  final LoginRepository _repository;
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  void onTapButton() async {
    if (phoneNumberValidator(phoneTextEditingController.text)) {
      final response =
          await _repository.login(userName: phoneTextEditingController.text);
      isLoading(true);
      response.when(success: (data) {
        final String key = data['key'];
        Get.toNamed(Routes.OTP, arguments: {
          "key": key,
          "phoneNumber": phoneTextEditingController.text,
        });
      }, failure: (error) {
        Get.snackbar(
          "خطا",
          "خطا در اتصال به سرور",
          snackStyle: SnackStyle.GROUNDED,
          snackPosition: SnackPosition.TOP,
        );
      });
      isLoading(false);
    }
    formKey.currentState?.validate();
  }

  validation({
    required String? text,
    required String message,
    required String toShort,
    required String inValid,
  }) {
    if (text == null || text.isEmpty) return message;
    if (text.length < 11) return toShort;
    if (!phoneNumberValidator(text)) return inValid;
    return null;
  }

  phoneNumberValidator(String phoneNumber) {
    String pattern = r'(^((09){1}[0-9]{9})$)';
    RegExp phoneNumberReg = RegExp(pattern);
    if (phoneNumberReg.hasMatch(phoneNumber)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    phoneTextEditingController.dispose();
  }
}
