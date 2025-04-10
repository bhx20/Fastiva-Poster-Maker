import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../core/string.dart';
import '../../../model/response/dowload_model.dart';
import '../../../uttils/globle_uttils.dart';
import '../../../uttils/local_store/sql_helper.dart';

class DownloadController extends GetxController {
  var downloadLoaded = false.obs;
  final dbHelper = DbHelper.instance;
  var paginateIndex = 0.obs;
  int pageLength = 6;
  var loadPaginate = false.obs;
  RxList<DownLoadData> downloadImages = <DownLoadData>[].obs;
  RxList<DownLoadData> paginatedDownloadList = <DownLoadData>[].obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    dwnInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    dwnDispose();
  }

  dwnInit() {
    scrollController.addListener(scrollListener);
    getDownLoadList();
  }

  dwnDispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
  }

  /// Delete Images From Directory
  void deleteFile({required String filePath, required int id}) {
    dbHelper.deleteQuery(
        SqlTableString.downloadedImages, id, SqlTableString.dbId);
    File file = File(filePath);
    if (file.existsSync()) {
      file.deleteSync();
    }
    Get.back();
    getDownLoadList();
  }

  /// Get Downloaded Files
  Future<void> getDownLoadList() async {
    downloadLoaded(false);
    var downLoadData = await dbHelper.queryAll(SqlTableString.downloadedImages);
    String downloadDataJson = jsonEncode(downLoadData);
    List<DownLoadData> downloadImageList =
        downloadDataFromJson(downloadDataJson);
    downloadImages.value = downloadImageList;
    paginatedDownloadList.clear();
    paginateIndex(0);
    downloadImages.sort((a, b) => b.dbCreatedAt!.compareTo(a.dbCreatedAt!));
    if (downloadImages.length > 6) {
      pageLength = 6;
    } else {
      pageLength = downloadImages.length;
    }
    appPrint(paginatedDownloadList);
    for (int i = 0; i < pageLength; i++) {
      paginatedDownloadList.add(downloadImages[paginateIndex.value]);

      if (downloadImages.length > paginateIndex.value) {
        paginateIndex.value++;
      }
    }
    paginatedDownloadList
        .sort((a, b) => b.dbCreatedAt!.compareTo(a.dbCreatedAt!));
    update();
    downloadLoaded(true);
  }

  /// get byte image
  Future<ByteData> loadImageByteData(String path) async {
    File imageFile = File(path);
    List<int> bytes = await imageFile.readAsBytes();
    return ByteData.view(Uint8List.fromList(bytes).buffer);
  }

  Future<void> scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (loadPaginate.isFalse) {
        if (downloadImages.length > paginatedDownloadList.length) {
          loadPaginate(true);
          await Future.delayed(const Duration(seconds: 2));

          int listLength =
              (downloadImages.length) - (paginatedDownloadList.length);

          if (listLength > 6) {
            pageLength = 6;
          } else {
            pageLength = listLength;
          }
          for (int i = 0; i < pageLength; i++) {
            paginatedDownloadList.add(downloadImages[paginateIndex.value]);
            appPrint(paginatedDownloadList);
            if (downloadImages.length > paginateIndex.value) {
              paginateIndex.value++;
            }
          }
          paginatedDownloadList
              .sort((a, b) => b.dbCreatedAt!.compareTo(a.dbCreatedAt!));
          loadPaginate(false);
        }
      }
    }
  }
}
