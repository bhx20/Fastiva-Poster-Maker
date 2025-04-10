import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:festiva_poster/app/modules/editPoster/views/edit_poster_view.dart';
import 'package:festiva_poster/app/modules/likes/controllers/likes_controller.dart';
import 'package:festiva_poster/app/uttils/globle_uttils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/repo/repo.dart';
import '../../../model/response/home_poster_data.dart';
import '../../../model/response/likes_model.dart';
import '../../../model/response/profile_data_model.dart';
import '../../../reusable/dialogs/app_dialogs.dart';
import '../../../reusable/globle_widget.dart';
import '../../../routes/app_pages.dart';
import '../../profile/controllers/profile_controller.dart';

class HomeController extends GetxController {
//==============================================================================
// ** Properties **
//==============================================================================
  ScrollController scrollController = ScrollController();

  var isCatagoryData = false.obs;
  var isSearchedData = false.obs;
  var isPosterData = true.obs;
  var searchPage = false.obs;
  var isSearch = false.obs;
  final searchController = TextEditingController();
  Rx<HomePoster> posterDataList = HomePoster().obs;
  RxList<CategoryList> searchedList = <CategoryList>[].obs;
  RxList<CategoryList> homePaginatedList = <CategoryList>[].obs;
  var currentIndex = 0.obs;
  var paginateIndex = 0.obs;
  var loadPaginate = false.obs;
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> connectivitySubscription;
  var likeController = Get.put(LikesController());
  RxList<ProfileData> myProfiles = <ProfileData>[].obs;
  List<LikesData> imagesList = [];

//==============================================================================
// ** Life Cycle **
//==============================================================================

  @override
  void onInit() {
    super.onInit();
    homeInit();
    myProfiles = Get.put(ProfileController()).myProfiles;
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

  homeInit() {
    scrollController.addListener(homeScrollListener);
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> results) async {
    final isConnected =
        results.any((result) => result != ConnectivityResult.none);
    if (isConnected) {
      getHomePosterData();
    }
  }

  getHomePosterData() async {
    isCatagoryData(false);
    await ServerDataRepo.getInstance().getHomePoster().then((response) {
      response.fold((l) {
        appPrint(l);
        showToast(l);
      }, (r) {
        posterDataList.value = r;
        posterDataList.value.result?.categoryList
            ?.sort((a, b) => b.sortOrder!.compareTo(a.sortOrder!));

        for (int i = 0; i < 3; i++) {
          homePaginatedList.add(
              posterDataList.value.result!.categoryList![paginateIndex.value]);
          homePaginatedList[paginateIndex.value].posterList?.shuffle();
          if (posterDataList.value.result!.categoryList!.length >
              paginateIndex.value) {
            paginateIndex.value++;
          }
        }
        update();
        isCatagoryData(true);
        appPrint(r);
      });
    });
    imagesList = await likeController.getLikedImagesList();
  }

  viewAll(List<CategoryList>? categoryList, int index) {
    Get.toNamed(Routes.CATEGORY_DETAILS,
        arguments: categoryList?[index].catId ?? "1");
  }

  openPoster(BuildContext context, {required String image, required int pro}) {
    if (myProfiles.isNotEmpty) {
      showFastivaBottomSheet(context, EditPosterView(poster: image));
    } else {
      AppDialogs.showAddProfile(context);
    }
  }

  Future<void> homeScrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (posterDataList.value.result!.categoryList!.length >
          homePaginatedList.length) {
        loadPaginate(true);
        await Future.delayed(const Duration(seconds: 1));
        for (int i = 0; i < 3; i++) {
          homePaginatedList.add(
              posterDataList.value.result!.categoryList![paginateIndex.value]);
          homePaginatedList[paginateIndex.value].posterList?.shuffle();
          paginateIndex.value++;
        }
        appPrint("homePaginatedList.length");
        appPrint(homePaginatedList.length);
        loadPaginate(false);
      }
    }
  }
}
