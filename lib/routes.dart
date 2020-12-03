import 'package:UI_House/bindings/bindings.dart';
import 'package:UI_House/views/views.dart';
import 'package:UI_House/widgets/homeWidget.dart';
import 'package:get/route_manager.dart';

const String startroute = '/';
const String hafroute = '/handf';
const String homeroute = '/home';

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
    page: () => HomeWidget(),
    binding: HomeBinding(),
  ),
];
