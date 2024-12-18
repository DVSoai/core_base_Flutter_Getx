import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';

Future<String> showImageChoices({
  required BuildContext context,
}) async {
  String? imgPath;

  imgPath = await showModalBottomSheet<String?>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: .6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Select Image',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Ionicons.camera_outline),
              title: const Text('Camera'),
              onTap: () async {
                final pickedPath =
                await pickImage(camera: true, context: context);
                Get.back(result: pickedPath);
              },
            ),
            ListTile(
              leading: const Icon(Ionicons.image),
              title: const Text('Gallery'),
              onTap: () async {
                final pickedPath =
                await pickImage(camera: false, context: context);
                Get.back(result: pickedPath);
              },
            ),
          ],
        ),
      );
    },
  );
  return imgPath ?? '';
}

Future<String> pickImage(
    {bool camera = false, required BuildContext context}) async {
  try {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: camera ? ImageSource.camera : ImageSource.gallery,
        imageQuality: 50);
    return pickedFile!.path;
  } catch (e) {
    if (context.mounted) Get.snackbar('Error', 'Failed to pick image');
    return Future.error(e);
  }
}
