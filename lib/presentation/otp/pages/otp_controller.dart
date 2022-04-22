import 'package:get/get.dart';
import 'package:reminder/app/routes/app_routes.dart';
import 'package:reminder/app/store/user_store_service.dart';
import 'package:reminder/presentation/otp/repo/otp_repository.dart';

class OTPController extends GetxController {
  OTPController(this._repository);

  final OTPRepository _repository;
  String? phoneNumber, key, otpCode;

  @override
  void onInit() {
    var data = Get.arguments;
    phoneNumber = data['phoneNumber'];
    key = data['key'];
    super.onInit();
  }

  void onTapButton() async {
    if ((phoneNumber != null && phoneNumber!.isNotEmpty) &&
        (key != null && key!.isNotEmpty) &&
        (otpCode != null && otpCode!.isNotEmpty)) {
      final response = await _repository.otp(
          userName: phoneNumber!, key: key!, otp: int.parse(otpCode!));
      response.when(success: (data) {
        final String token = data['token'];
        TokenStoreService.to.saveToken(token);
        Get.offAndToNamed(Routes.CALENDER);
      }, failure: (error) {
        Get.snackbar(
          "خطا",
          "رمز وارد شده اشتباه است.",
          snackStyle: SnackStyle.GROUNDED,
          snackPosition: SnackPosition.TOP,
        );
      });
    } else {
      Get.snackbar(
        "خطا",
        "رمز وارد شده اشتباه است.",
        snackStyle: SnackStyle.GROUNDED,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  setOTP(String value) => otpCode = value;
}
