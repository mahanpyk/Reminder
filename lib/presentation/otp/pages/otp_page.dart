import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:reminder/app/base/base_view.dart';
import 'package:reminder/app/theme/app_colors.dart';
import 'package:reminder/presentation/components/send_button.dart';
import 'package:reminder/presentation/otp/pages/otp_controller.dart';

class OTPPage extends BaseView {
  OTPPage({Key? key}) : super(key: key);

  final OTPController _controller = Get.find<OTPController>();

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(children: [
          Text(
            "کد چهار رقمی ارسال شده به شماره‌ی",
            style: Get.theme.textTheme.bodyText2,
          ),
          Row(children: [
            Text(
              _controller.phoneNumber ?? "",
              style: Get.theme.textTheme.bodyText2!
                  .copyWith(color: AppColors.buttonFirstColor),
            ),
            Text(
              "را وارد کنید.",
              style: Get.theme.textTheme.bodyText2,
            ),
          ]),
          const SizedBox(height: 48),
          Directionality(
            textDirection: TextDirection.ltr,
            child: OtpTextField(
              onCodeChanged: (value) {},
              textStyle: Get.theme.textTheme.bodyText1,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              numberOfFields: 4,
              hasCustomInputDecoration: true,
              decoration: InputDecoration(
                counterText: '',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                hintText: "۰",
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
            ),
          ),
          const SizedBox(height: 24),
          SendButton(onTap: () => _controller.onTapButton())
        ]),
      ]),
    );
  }
}
