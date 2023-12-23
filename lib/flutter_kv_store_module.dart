import 'package:flutter_kv_store/flutter_kv_store_platform.dart';

class FlutterKvStoreModule {
  String module;
  String? aesKey;
  String? aesIV;
  bool? isAsyncApply;
  bool? isKeepKeyClearText;

  FlutterKvStoreModule(
    this.module, {
    this.aesKey,
    this.aesIV,
    this.isAsyncApply,
    this.isKeepKeyClearText,
  }) {
    FlutterKvStorePlatform.register(
      module,
      aesKey: aesKey,
      aesIV: aesIV,
      isAsyncApply: isAsyncApply,
      isKeepKeyClearText: isKeepKeyClearText,
    );
  }

  Future<bool> dispose() async {
    return await FlutterKvStorePlatform.unregister(module);
  }

  Future<bool> contains(String key) async {
    return await FlutterKvStorePlatform.contains(module, key: key);
  }

  Future<bool> removeKey(String key) async {
    return await FlutterKvStorePlatform.removeKey(module, key: key);
  }

  Future<String?> getString(String key) async {
    return await FlutterKvStorePlatform.getString(module, key: key);
  }

  Future<int?> getInt(String key) async {
    return await FlutterKvStorePlatform.getInt(module, key: key);
  }

  Future<double?> getDouble(String key) async {
    return await FlutterKvStorePlatform.getDouble(module, key: key);
  }

  Future<bool?> getBoolean(String key) async {
    return await FlutterKvStorePlatform.getBoolean(module, key: key);
  }

  Future<bool> setString(String key, String value) async {
    return await FlutterKvStorePlatform.setString(module, key: key, value: value);
  }

  Future<bool> setInt(String key, int value) async {
    return await FlutterKvStorePlatform.setInt(module, key: key, value: value);
  }

  Future<bool> setDouble(String key, double value) async {
    return await FlutterKvStorePlatform.setDouble(module, key: key, value: value);
  }

  Future<bool> setBoolean(String key, bool value) async {
    return await FlutterKvStorePlatform.setBoolean(module, key: key, value: value);
  }
}
