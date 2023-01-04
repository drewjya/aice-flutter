import 'dart:io';

import 'package:aice/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart' as picker;

Future<File?> picturePicker() async {
  final filePicker = await picker.ImagePicker().pickImage(
    preferredCameraDevice: picker.CameraDevice.rear,
    source: picker.ImageSource.camera,
    maxWidth: 480,
    maxHeight: 600,
  );

  if (filePicker != null) {
    return File(filePicker.path);
  }
  return null;
}

class ImageSalesPicker extends HookWidget {
  const ImageSalesPicker({
    super.key,
    required this.file,
    required this.title,
  });
  final ValueNotifier<File?> file;
  final String title;
  @override
  Widget build(BuildContext context) {
    final errorText = useState<String?>(null);
    return FormField(validator: (value) {
      if (file.value == null) {
        errorText.value = "Tidak Boleh Kosong";
      } else {
        errorText.value = null;
      }
      print(errorText.value);
      return errorText.value;
    }, builder: (field) {
      return Column(
        children: [
          Card(
            child: InkWell(
              onTap: () async {
                final image = await picturePicker();
                file.value = image;
              },
              child: SizedBox(
                height: 40.width(context) - (errorText.value != null ? 12 : 0),
                child: Stack(
                  children: [
                    Center(
                      child: file.value != null
                          ? Image.file(
                              file.value!,
                              fit: BoxFit.fill,
                            )
                          : const Icon(
                              Icons.camera_alt,
                              size: 50,
                            ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 100.width(context),
                        height: 20,
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (errorText.value != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(),
              child: Text(
                errorText.value!,
                style: const TextStyle(color: Colors.red, fontSize: 10),
              ),
            )
          ]
        ],
      );
    });
  }
}
