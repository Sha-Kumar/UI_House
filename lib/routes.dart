import 'package:UI_House/bindings/bindings.dart';
import 'package:UI_House/views/views.dart';
import 'package:get/route_manager.dart';

const String startroute = '/';

final routes = [
  GetPage(
    name: startroute,
    page: () => StartView(),
    binding: HomeBinding(),
  ),
];
