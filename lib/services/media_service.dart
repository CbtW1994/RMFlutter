import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MediaService {
  final imagePicker = ImagePicker();

  Future<File> getImage({bool fromGallery}) async {
    final pickedFile = await imagePicker.getImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
    );

    return File(pickedFile.path);
  }
}
