import 'package:UI_House/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostImage extends GetView<HomeController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PostImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: Center(
          child: SizedBox(
            width: 750,
            child: Material(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Spacer(),
                    Container(
                      height: 500,
                      width: 500,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                        color: Colors.amber,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          controller.photos[controller.curind.value].photoUrl
                              .toString(),
                          fit: BoxFit.fill,
                          repeat: ImageRepeat.repeat,
                          // scale: ,
                        ),
                      ),
                    ),
                    const Spacer(),
                    RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          if (Get.isDialogOpen) {
                            Get.back();
                          }
                        }
                      },
                      color: Colors.blueAccent,
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
