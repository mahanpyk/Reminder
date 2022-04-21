import 'package:get/get.dart';
import 'package:reminder/app/services/storege_service.dart';
import 'package:reminder/app/store/user_store_service.dart';


class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorage>(() => StorageService());

    Get.put<TokenStoreService>(TokenStoreService(Get.find<LocalStorage>()),
        permanent: true);
  }
}
