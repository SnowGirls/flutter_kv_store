import 'package:flutter_kv_store/flutter_kv_store_module.dart';

class FlutterKvStoreTest {
  static final String _aesKey = "AbCAbCAb" * 4;

  static final String _aesIV = "AbCAbCAb" * 2;

  // full encrypted
  static FlutterKvStoreModule secure = FlutterKvStoreModule("xdragon.secure", aesKey: _aesKey, aesIV: _aesIV);

  // semi encrypt: key is clear text, value is encrypted
  static FlutterKvStoreModule semiSafe =
      FlutterKvStoreModule("xdragon.semi.safe", aesKey: _aesKey, aesIV: _aesIV, isKeepKeyClearText: true);

  // normal, all is clear text
  static FlutterKvStoreModule normal = FlutterKvStoreModule("xdragon.normal");

  // config center data
  static FlutterKvStoreModule configCenter = FlutterKvStoreModule("xdragon.config.center", isAsyncApply: true);

  // user information
  static FlutterKvStoreModule userDetail =
      FlutterKvStoreModule("xdragon.user.detail", aesKey: _aesKey, aesIV: _aesIV, isAsyncApply: true);
}
