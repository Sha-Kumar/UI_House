// import 'package:UI_House/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:UI_House/controllers/controllers.dart';

class UploadView extends GetView<UploadController> {
  final UploadController uploadController = Get.find();
  // final service = FirebaseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UploadView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: Center(
        child: SizedBox(
          width: 500,
          child: Material(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Spacer(),
                  const Text(
                    'Upload The UI - Image',
                    style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontSize: 28,
                        fontWeight: FontWeight.w400),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    child: TextFormField(
                      controller: uploadController.title,
                      decoration: InputDecoration(
                        labelText: "Enter the title of the Image",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21.0),
                        ),
                        prefixIcon: const Material(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: Icon(
                            Icons.announcement,
                            color: Colors.lime,
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Title cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   height: 40,
                  //   child: InkWell(
                  //     onTap: () {
                  //       uploadController.uploadImage();
                  //     },
                  //     child: Obx(
                  //       () => uploadController.isUploaded.value
                  //           ? const Icon(
                  //               Icons.add_photo_alternate,
                  //               color: Colors.black,
                  //             )
                  //           : const Spacer(),
                  //     ),
                  //   ),
                  // ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 200,
                        width: 250,
                        child: uploadController.isUploaded.value
                            ? Image.memory(uploadController.upimg)
                            : InkWell(
                                onTap: () {
                                  uploadController.uploadImage();
                                },
                                child: const Icon(
                                  Icons.add_photo_alternate,
                                  color: Colors.black,
                                  size: 50,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 165,
                          right: 10,
                        ),
                        child: RaisedButton(
                          onPressed: () async {
                            if (Get.isDialogOpen) {
                              uploadController.title.clear();
                              uploadController.isUploaded.value = false;
                              Get.back();
                            }
                          },
                          color: Colors.blueAccent,
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await uploadController.nextUpload();

                              if (Get.isDialogOpen) {
                                uploadController.title.clear();
                                uploadController.isUploaded.value = false;
                                Get.back();
                              }
                              Get.snackbar(
                                'Upload Successful',
                                'Successfully uploaded the image to the UI_House',
                                duration: const Duration(
                                  seconds: 2,
                                ),
                                colorText: Colors.white,
                                backgroundColor: Colors.black87,
                                snackPosition: SnackPosition.TOP,
                              );
                            }
                          },
                          color: Colors.blueAccent,
                          child: const Text(
                            'Upload',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // RaisedButton(
                  //   onPressed: () async {
                  //     if (_formKey.currentState.validate()) {
                  //       if (Get.isDialogOpen) {
                  //         uploadController.title.clear();
                  //         Get.back();
                  //       }
                  //     }
                  //   },
                  //   color: Colors.blueAccent,
                  //   child: const Text(
                  //     'Upload',
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                  const Spacer(),
                  const SizedBox.shrink(),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
