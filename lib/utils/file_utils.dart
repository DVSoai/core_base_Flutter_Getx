import 'dart:async';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get_connect.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

Future<MultipartFile> convertMultipartFile(String imageSellectPath) async {
  XFile imageSellect;
  if (imageSellectPath.startsWith('http')) {
    imageSellect = await getImageXFileByUrl(imageSellectPath);
  } else {
    imageSellect = XFile(imageSellectPath);
  }
  return MultipartFile(imageSellect.path,
      filename: imageSellect.name,
      contentType: lookupMimeType(imageSellect.path) ?? 'image/jpeg');
}

Future<XFile> getImageXFileByUrl(String url) async {
  var file = await DefaultCacheManager().getSingleFile(url);
  XFile result = XFile(file.path);
  return result;
}
