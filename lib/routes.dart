import 'package:UI_House/bindings/bindings.dart';
import 'package:UI_House/views/homeView.dart';
import 'package:UI_House/views/views.dart';
import 'package:get/route_manager.dart';

const String startroute = '/';
const String hafroute = '/helpandsuport';
const String homeroute = '/home';
const String profilrroute = '/profile';

final routes = [
  GetPage(
    name: startroute,
    page: () => StartView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: hafroute,
    // ignore: prefer_const_constructors
    page: () => HAndFView(),
    binding: HAFBinding(),
  ),
  GetPage(
    name: homeroute,
    page: () => HomeView(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: profilrroute,
    // ignore: prefer_const_constructors
    page: () => ProfileView(),
    binding: ProfileBinding(),
  )
];
