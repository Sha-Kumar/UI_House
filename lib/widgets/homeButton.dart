import 'package:UI_House/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeButton extends GetView<AuthController> {
  final String description;
  const HomeButton({
    @required this.description,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        description.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
