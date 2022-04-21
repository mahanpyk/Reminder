import 'package:get/get.dart';
import 'package:reminder/app/binding/login_binding.dart';
import 'package:reminder/app/binding/otp_binding.dart';
import 'package:reminder/app/routes/app_routes.dart';
import 'package:reminder/presentation/login/pages/login_page.dart';
import 'package:reminder/presentation/otp/pages/otp_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.OTP,
      page: () => OTPPage(),
      binding: OTPBinding(),
    ),
  ];
}
