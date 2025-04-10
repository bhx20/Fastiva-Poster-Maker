import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/core.dart';
import '../../../../model/global.dart';
import '../../../../routes/app_pages.dart';
import '../../../../uttils/uttils.dart';
import '../../../download/controllers/download_controller.dart';

class CaptureController {
  static final CaptureController instance = CaptureController._internal();

  factory CaptureController() {
    return instance;
  }
  CaptureController._internal();

//==============================================================================
// ** Properties **
//==============================================================================

  var hideWaterMarkFrame = false.obs;
  var isCapturing = false.obs;
  GlobalKey globalKey = GlobalKey();
  final dbHelper = DbHelper.instance;

//==============================================================================
// ** Functions **
//==============================================================================

  captureImage() async {
    hideWaterMarkFrame(true);
    isCapturing(true);
    await Future.delayed(const Duration(milliseconds: 500)).then((_) async {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 10.0);
      ByteData? byteData = await (image.toByteData(
        format: ui.ImageByteFormat.png,
      ));
      await savedDownloadedImage(byteData!);
      isCapturing(false);
      hideWaterMarkFrame(false);
    });
  }

  /// Get Directory path
  Future<String> getApplicationDocumentsDirectoryPath() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// generate Unique Image Name
  String generateUniqueFileName() {
    DateTime now = DateTime.now();
    return 'download_${now.microsecondsSinceEpoch}.png';
  }

  /// To save the data on Local DB
  Future<String> saveOnLocalDB(String path) async {
    Map<String, dynamic> row = {
      SqlTableString.images: path,
    };
    await dbHelper.insert(SqlTableString.downloadedImages, row);
    return path;
  }

  savedDownloadedImage(ByteData byteData) async {
    final Uint8List bytes = byteData.buffer.asUint8List();

    final String projectDirectory =
        await getApplicationDocumentsDirectoryPath();
    final String fileName = generateUniqueFileName();
    final File newFile = File('$projectDirectory/$fileName');

    File savedImage = await newFile.writeAsBytes(bytes);
    String savedFilepath = await saveOnLocalDB(savedImage.path);
    Get.put(DownloadController()).getDownLoadList();
    if (savedFilepath.isNotEmpty) {
      Get.toNamed(Routes.PREVIEW_DOWNLOAD,
          arguments: DownloadArgument(
              imagePath: savedFilepath, isDownload: false, byte: byteData));
    }
  }
}
