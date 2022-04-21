import 'dart:convert' as convert;

import 'package:get_storage/get_storage.dart';

abstract class LocalStorage {
  Future<void> write(String key, dynamic json);

  dynamic read<S>(String key, {S Function(Map) construct});

  void remove(String key);

  void removeAll();
}

class StorageService implements LocalStorage {
  StorageService() {
    _init();
  }

  late GetStorage storage;

  void _init() {
    storage = GetStorage();
  }

  @override
  Future<void> write(String key, dynamic value) async {
    await storage.write(key, convert.jsonEncode(value));
  }

  @override
  dynamic read<S>(String key, {S Function(Map)? construct}) {
    final value = storage.read(key);
    if (value == null) return;
    if (construct == null) return convert.jsonDecode(value);
    final Map<String, dynamic> json = convert.jsonDecode(value);

    return construct(json);
  }

  @override
  void remove(String key) {
    GetStorage().remove(key);
  }

  @override
  void removeAll() {
    throw UnimplementedError();
  }
}
