import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/app/base/base_view.dart';
import 'package:reminder/app/theme/app_colors.dart';
import 'package:reminder/presentation/components/send_button.dart';
import 'package:reminder/presentation/login/pages/login_controller.dart';

class LoginPage extends BaseView {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _controller = Get.find<LoginController>();

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Text(
            "لطفا شماره‌ی تلفن همراه خود را وارد کنید.",
            style: Get.theme.textTheme.bodyText2,
          ),
          const SizedBox(height: 48),
          Form(
            key: _controller.formKey,
            child: TextFormField(
              maxLength: 11,
              style: Get.theme.textTheme.bodyText1,
              controller: _controller.phoneTextEditingController,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: const EdgeInsets.all(16),
                hintText: "مثال: ۰۹۳۶۵۴۶۴۷۸۶",
                hintStyle: Get.theme.textTheme.bodyText1!
                    .copyWith(color: AppColors.secondaryTextColor),
                filled: true,
                fillColor: AppColors.editTextColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.editTextBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.editTextBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.editTextBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.editTextBorderColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) => _controller.validation(
                text: value,
                message: "لطفا شماره تلفن خود را وارد کنید",
                toShort: "شماره تلفن وارد شده کوتاه است",
                inValid: "شماره تلفن وارده شده معتبر نمیباشد",
              ),
            ),
          ),
          const SizedBox(height: 24),
          SendButton(onTap: () => _controller.onTapButton())
        ]),
      ]),
    );
  }
}
