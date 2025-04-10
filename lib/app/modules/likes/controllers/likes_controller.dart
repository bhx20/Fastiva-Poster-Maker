import 'dart:convert';

import 'package:festiva_poster/app/model/response/likes_model.dart';
import 'package:festiva_poster/app/uttils/globle_uttils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/string.dart';
import '../../../uttils/local_store/sql_helper.dart';

class LikesController extends GetxController {
  final dbHelper = DbHelper.instance;
  var likesLoaded = false.obs;
  RxList<LikesData> likedImages = <LikesData>[].obs;
  RxList<LikesData> paginatedLikedImages = <LikesData>[].obs;
  ScrollController scrollController = ScrollController();
  var paginateIndex = 0.obs;
  int pageLength = 6;
  var loadPaginate = false.obs;
  var totalLikes = 0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    getLikedImagesList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

//==============================================================================
// ** Functions **
//==============================================================================
  /// Add to Like Images List
  void addToLikes(String path, int isPremium) async {
    Map<String, dynamic> row = {
      SqlTableString.images: path,
      SqlTableString.isPremium: isPremium,
    };
    await dbHelper.insert(SqlTableString.likedImages, row);
    appPrint("Image Added");
    getLikedImagesList();
  }

  /// Remove Liked Images Files
  removeToLikes(String path) async {
    dbHelper.deleteQuery(
        SqlTableString.likedImages, path, SqlTableString.images);
    appPrint("Image Removed");
    getLikedImagesList();
  }

  /// Get Liked Images Files
  Future<List<LikesData>> getLikedImagesList() async {
    likesLoaded(false);
    var downLoadData = await dbHelper.queryAll(SqlTableString.likedImages);
    String downloadDataJson = jsonEncode(downLoadData);
    List<LikesData> likedImageList = likesDataFromJson(downloadDataJson);
    likedImages.value = likedImageList;

    paginatedLikedImages.clear();
    paginateIndex(0);
    paginatedLikedImages
        .sort((a, b) => b.dbCreatedAt!.compareTo(a.dbCreatedAt!));
    if (likedImages.length > 6) {
      pageLength = 6;
    } else {
      pageLength = likedImages.length;
    }
    appPrint(paginatedLikedImages);
    for (int i = 0; i < pageLength; i++) {
      paginatedLikedImages.add(likedImages[paginateIndex.value]);

      if (likedImages.length > paginateIndex.value) {
        paginateIndex.value++;
      }
    }
    paginatedLikedImages
        .sort((a, b) => b.dbCreatedAt!.compareTo(a.dbCreatedAt!));
    update();
    likesLoaded(true);
    totalLikes(paginatedLikedImages.length);
    print(totalLikes);
    print(totalLikes);
    return paginatedLikedImages;
  }

  Future<void> scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (loadPaginate.isFalse) {
        if (likedImages.length > paginatedLikedImages.length) {
          loadPaginate(true);
          await Future.delayed(const Duration(seconds: 2));

          int listLength = (likedImages.length) - (paginatedLikedImages.length);

          if (listLength > 6) {
            pageLength = 6;
          } else {
            pageLength = listLength;
          }
          for (int i = 0; i < pageLength; i++) {
            paginatedLikedImages.add(likedImages[paginateIndex.value]);
            appPrint(paginatedLikedImages);
            if (likedImages.length > paginateIndex.value) {
              paginateIndex.value++;
            }
          }
          paginatedLikedImages
              .sort((a, b) => b.dbCreatedAt!.compareTo(a.dbCreatedAt!));
          loadPaginate(false);
        }
      }
    }
  }
}
