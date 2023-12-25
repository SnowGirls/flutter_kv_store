import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_kv_store/flutter_kv_store_module.dart';
import 'package:flutter_kv_store_example/flutter_kv_store_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    doStoreTest();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('Running on: \n'),
        ),
      ),
    );
  }

  void doStoreTest() async {
    {
      FlutterKvStoreModule secure = FlutterKvStoreTest.secure;
      await secure.setString("String", json.encode({"json": "你🚫好GoodJob"}));
      var str = await secure.getString("String");
      Map map = str != null ? json.decode(str) : null;
      print('@@@@@@ secure map: $map');
    }

    {
      FlutterKvStoreModule semiSafe = FlutterKvStoreTest.semiSafe;
      await semiSafe.setString("String", json.encode({"json": "你🚫好GoodJob"}));
      var str = await semiSafe.getString("String");
      Map map = str != null ? json.decode(str) : null;
      print('@@@@@@ semiSafe map: $map');
    }

    {
      FlutterKvStoreModule userDetail = FlutterKvStoreTest.userDetail;
      await userDetail.setString("String", json.encode({"json": "你🚫好GoodJob"}));
      var str = await userDetail.getString("String");
      Map map = str != null ? json.decode(str) : null;
      print('@@@@@@ userDetail map: $map');
    }

    {
      FlutterKvStoreModule configCenter = FlutterKvStoreTest.configCenter;
      await configCenter.setString("String", json.encode({"json": "你🚫好GoodJob"}));
      var str = await configCenter.getString("String");
      Map map = str != null ? json.decode(str) : null;
      print('@@@@@@ configCenter map: $map');
    }

    {
      FlutterKvStoreModule normal = FlutterKvStoreTest.normal;
      await normal.setString("String", "Hello world");
      await normal.setInt("Int", 10086);
      await normal.setDouble("Double", 10086.12345);
      await normal.setBoolean("Boolean", true);

      var str = await normal.getString("String");
      var int = await normal.getInt("Int");
      var dou = await normal.getDouble("Double");
      var boo = await normal.getBoolean("Boolean");
      print('@@@@@@ normal set&get: $str, $int, $dou, $boo');

      bool isContain1 = await normal.contains("Boolean");
      await normal.removeKey("Boolean");
      bool isContains2 = await normal.contains("Boolean");
      var boolNull = await normal.getBoolean("Boolean");

      await normal.setString("__ok_string__", "Hello 💯🐶你好");
      var okStrValue1 = await normal.getString("__ok_string__");
      await normal.setString("__ok_string__", "💯💯💯💯💯💯");
      var okStrValue2 = await normal.getString("__ok_string__");
      await normal.removeKey("__ok_string__");
      var okStrValueNull = await normal.getString("__ok_string__");

      await normal.setInt("__ok_int__", 100096666666);
      var okIntValue1 = await normal.getInt("__ok_int__");
      await normal.setInt("__ok_int__", 777777777777);
      var okIntValue2 = await normal.getInt("__ok_int__");
      await normal.removeKey("__ok_int__");
      var okIntValueNull = await normal.getInt("__ok_int__");

      await normal.setDouble("__ok_double__", 1009.888);
      var okDoubleValue1 = await normal.getDouble("__ok_double__");
      await normal.setDouble("__ok_double__", 888888.000999);
      var okDoubleValue2 = await normal.getDouble("__ok_double__");
      await normal.removeKey("__ok_double__");
      var okDoubleValueNull = await normal.getDouble("__ok_double__");

      print(''
          '@@@@@@ normal contains: $isContain1, $isContains2, null? $boolNull(${boolNull == null}),'
          ' okStr: $okStrValue1, $okStrValue2, null? $okStrValueNull(${okStrValueNull == null})'
          ' okInt: $okIntValue1, $okIntValue2, null? $okIntValueNull(${okIntValueNull == null})'
          ' okDouble: $okDoubleValue1, $okDoubleValue2, null? $okDoubleValueNull(${okDoubleValueNull == null})'
          '');

      await normal.removeKey("__ok_double__");
      await normal.removeKey("__ok_double__");
      await normal.removeKey("__not_existed_key__");
      print('######## DONE #########');
    }
  }
}
