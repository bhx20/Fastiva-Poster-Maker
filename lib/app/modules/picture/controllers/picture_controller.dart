import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:festiva_poster/app/uttils/globle_uttils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repo/repo.dart';
import '../../../model/response/home_poster_data.dart';
import '../../../reusable/globle_widget.dart';

class PictureController extends GetxController {
//==============================================================================
// ** Properties **
//==============================================================================
  ScrollController scrollController = ScrollController();
  var isConnection = true.obs;
  var isPosterData = false.obs;
  Rx<HomePoster> posterDataList = HomePoster().obs;
  var paginateIndex = 0.obs;
  var loadPaginate = false.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  RxList<CategoryList> picturePaginatedList = <CategoryList>[].obs;
//==============================================================================
// ** Life Cycle **
//==============================================================================

  @override
  void onInit() {
    pictureInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pictureDispose();
    super.onClose();
  }

//==============================================================================
// ** Functions **
//==============================================================================

  pictureInit() {
    scrollController.addListener(pictureScrollListener);
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  pictureDispose() {
    connectivitySubscription.cancel();
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    final isConnected =
        results.any((result) => result != ConnectivityResult.none);
    if (isConnected) {
      await gePosterCatagoryData();
    }
  }

  gePosterCatagoryData() async {
    isPosterData(false);
    await ServerDataRepo.getInstance().getHomePoster().then((response) {
      response.fold((l) {
        appPrint(l);
        showToast(l);
      }, (r) {
        posterDataList.value = r;
        posterDataList.value.result?.categoryList
            ?.sort((a, b) => b.sortOrder!.compareTo(a.sortOrder!));

        for (int i = 0; i < 6; i++) {
          picturePaginatedList.add(
              posterDataList.value.result!.categoryList![paginateIndex.value]);
          picturePaginatedList[paginateIndex.value].posterList?.shuffle();
          if (posterDataList.value.result!.categoryList!.length >
              paginateIndex.value) {
            paginateIndex.value++;
          }
        }
        isPosterData(true);
        appPrint(r);
      });
    });
  }

  Future<void> pictureScrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (loadPaginate.isFalse) {
        if (picturePaginatedList.length <
            posterDataList.value.result!.categoryList!.length) {
          loadPaginate(true);
          await Future.delayed(const Duration(seconds: 2));
          for (int i = 0; i < 6; i++) {
            if (picturePaginatedList.length <
                posterDataList.value.result!.categoryList!.length) {
              picturePaginatedList.add(posterDataList
                  .value.result!.categoryList![paginateIndex.value]);
              picturePaginatedList[paginateIndex.value].posterList?.shuffle();
              paginateIndex.value++;
            }
          }
          appPrint(picturePaginatedList.length);
          loadPaginate(false);
        }
      }
    }
  }
}
