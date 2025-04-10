import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:festiva_poster/app/reusable/globle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repo/repo.dart';
import '../../../model/response/catagory_data.dart';
import '../../../model/response/likes_model.dart';
import '../../../model/response/poster_details.dart';
import '../../../uttils/uttils.dart';
import '../../likes/controllers/likes_controller.dart';

class CategoryDetailsController extends GetxController {
//==============================================================================
// ** Properties **
//==============================================================================
  ScrollController scrollController = ScrollController();

  var isPosterDetails = false.obs;
  var isCatagoryData = false.obs;
  var selectedCatagory = 0.obs;
  Rx<PosterDetails> posterDetailsList = PosterDetails().obs;
  Rx<CatagoryModel> catagoryList = CatagoryModel().obs;
  var currentIndex = 0.obs;
  var paginateIndex = 0.obs;
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  var likeController = Get.put(LikesController());
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  List<LikesData> imagesList = [];
  RxList<PosterList> categoryPaginatedList = <PosterList>[].obs;
  RxBool paginatedLoader = false.obs;

//==============================================================================
// ** Life Cycle **
//==============================================================================

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    connectivitySubscription.cancel();
  }

//==============================================================================
// ** Functions **
//==============================================================================
  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    final isConnected =
        results.any((result) => result != ConnectivityResult.none);
    if (isConnected) {
      getData();
    }
  }

  getData() {
    if (Get.arguments == '19') {
      getCatagoryList();
    } else {
      getPosterDetailsData(url: Get.arguments);
    }
  }

  getPosterDetailsData({required String url}) async {
    isPosterDetails(false);
    ServerDataRepo.getInstance()
        .getPosterDetails(url: '/flyer$url.html')
        .then((response) {
      response.fold((l) {
        showToast(l);
      }, (r) {
        categoryPaginatedList.clear();
        paginateIndex(0);
        posterDetailsList.value = r;
        for (int i = 0; i < 6; i++) {
          categoryPaginatedList.add(
              posterDetailsList.value.result!.posterList![paginateIndex.value]);
          categoryPaginatedList.shuffle();
          if (posterDetailsList.value.result!.posterList!.length >
              paginateIndex.value) {
            paginateIndex.value++;
          }
        }
        isPosterDetails(true);
        appPrint(r);
      });
    });
    imagesList = await likeController.getLikedImagesList();
  }

  getCatagoryList() {
    isCatagoryData(false);
    ServerDataRepo.getInstance()
        .getCatagoryList()
        .then((response) => response.fold((l) {
              showToast(l);
            }, (r) {
              catagoryList.value = r;
              catagoryList.value.result?.categoryList
                  ?.sort((a, b) => b.sortOrder!.compareTo(a.sortOrder!));
              getPosterDetailsData(
                  url: catagoryList.value.result?.categoryList?.first.catId ??
                      "19");
              isCatagoryData(true);
            }));
  }

  void scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (paginatedLoader.isFalse) {
        if (paginateIndex.value <
            posterDetailsList.value.result!.posterList!.length) {
          paginatedLoader(true);
          await Future.delayed(const Duration(seconds: 2));
          for (int i = 0; i < 6; i++) {
            if (categoryPaginatedList.length <
                posterDetailsList.value.result!.posterList!.length) {
              categoryPaginatedList.add(posterDetailsList
                  .value.result!.posterList![paginateIndex.value]);
              paginateIndex.value++;
            }
          }
          appPrint(categoryPaginatedList.length);
          paginatedLoader(false);
        }
      }
    }
  }
}
