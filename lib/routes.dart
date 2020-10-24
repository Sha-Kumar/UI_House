import 'package:UI_House/bindings/bindings.dart';
import 'package:UI_House/views/views.dart';
import 'package:get/route_manager.dart';
// import 'views/views.dart';

const String startroute = '/';
const String homeroute = '/home';

final routes = [
  GetPage(
    name: startroute,
    page: () => StartView(),
    binding: AuthBinding(),
  ),
];
