import 'package:UI_House/routes.dart' as router;
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: router.startroute,
      getPages: router.routes,
      title: 'UI_HOUSE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // fontFamily: ,
        // fontFamily: 'ArimaMadurai',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  }
}
