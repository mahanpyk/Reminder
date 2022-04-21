import 'package:get/get.dart';
import 'package:reminder/presentation/login/pages/login_controller.dart';
import 'package:reminder/presentation/login/repo/login_repository.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
        () => LoginController(Get.find<LoginRepository>()));
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImp());
  }
}
