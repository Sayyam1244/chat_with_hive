import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

class FileServices {
  static Future<List<File>> getFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    return result?.files.map((e) => File(e.path!)).toList() ?? [];
  }

  static Future<List<File>> getImages() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);

    return result?.files.map((e) => File(e.path!)).toList() ?? [];
  }
}
