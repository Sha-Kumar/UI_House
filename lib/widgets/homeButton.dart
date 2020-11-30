import 'package:UI_House/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeButton extends GetView<AuthController> {
  final String description;
  final Function() onPressed;
  const HomeButton({
    @required this.description,
    this.onPressed,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        description.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
