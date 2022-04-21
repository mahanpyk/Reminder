import 'package:get/get.dart';
import 'package:reminder/presentation/otp/pages/otp_controller.dart';
import 'package:reminder/presentation/otp/repo/otp_repository.dart';

class OTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(() => OTPController(Get.find<OTPRepository>()));
    Get.lazyPut<OTPRepository>(() => OTPRepositoryImp());
  }
}
