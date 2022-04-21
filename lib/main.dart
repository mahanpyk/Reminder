import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/app/binding/main_binding.dart';
import 'package:reminder/app/routes/app_pages.dart';
import 'package:reminder/app/routes/app_routes.dart';
import 'package:reminder/app/theme/app_text_styles.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Reminder',
      theme: ThemeData(
        fontFamily: 'Dana',
        textTheme: TextTheme(
          headline1: AppTextStyles.headline1,
          headline2: AppTextStyles.headline2,
          headline3: AppTextStyles.headline3,
          headline4: AppTextStyles.headline4,
          headline5: AppTextStyles.headline5,
          headline6: AppTextStyles.headline6,
          subtitle1: AppTextStyles.subtitle1,
          subtitle2: AppTextStyles.subtitle2,
          bodyText1: AppTextStyles.bodyText1,
          bodyText2: AppTextStyles.bodyText2,
          caption: AppTextStyles.caption,
          button: AppTextStyles.button,
          overline: AppTextStyles.overLine,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.OTP,
      defaultTransition: Transition.rightToLeftWithFade,
      getPages: AppPages.pages,
      initialBinding: MainBinding(),
    ),
  );
}
