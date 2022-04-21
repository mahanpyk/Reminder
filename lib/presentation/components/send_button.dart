import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/app/theme/app_colors.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        radius: 24,
        highlightColor: Colors.transparent,
        onTap: () => onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              'ارسال',
              style: Get.theme.textTheme.button,
            ),
          ),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  stops: [0, 0.99, 1, 1],
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.buttonFirstColor,
                    AppColors.buttonSecondColor,
                    AppColors.buttonThirdColor,
                    AppColors.buttonFourthColor,
                  ]),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  spreadRadius: 0,
                  blurRadius: 8,
                  blurStyle: BlurStyle.outer,
                  offset: Offset(0, 0),
                )
              ]),
        ),
      ),
    );
  }
}
