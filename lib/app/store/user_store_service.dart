import 'dart:async';

import 'package:get/get.dart';
import 'package:reminder/app/models/event_model/event_model.dart';
import 'package:reminder/app/services/storege_service.dart';

class TokenStoreService extends GetxController {
  TokenStoreService(this._storage);

  final LocalStorage _storage;

  static TokenStoreService get to => Get.find();

  static const token = 'TOKEN';

  Future<void> saveToken(String tokenString) async {
    await _storage.write(token, tokenString);
  }

  EventModel? getToken() {
    var result = _storage.read(token);
    if (result == null) {
      return null;
    }
    return EventModel.fromJson(result);
  }
}
