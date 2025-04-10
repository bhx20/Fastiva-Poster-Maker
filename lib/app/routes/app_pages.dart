import 'package:get/get.dart';

import '../modules/CategoryDetails/views/category_details_view.dart';
import '../modules/addProfile/views/add_profile_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/download/views/download_view.dart';
import '../modules/editPoster/views/edit_poster_view.dart';
import '../modules/editPoster/views/select_profile.dart';
import '../modules/home/views/home_view.dart';
import '../modules/likes/views/likes_view.dart';
import '../modules/picture/views/picture_view.dart';
import '../modules/previewDownload/views/preview_download_view.dart';
import '../modules/profile/views/languages_view.dart';
import '../modules/profile/views/profile/poser_profile.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
    ),
    GetPage(
      name: _Paths.DOWNLOAD,
      page: () => const DownloadView(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
    ),
    GetPage(
      name: _Paths.PICTURE,
      page: () => const PictureView(),
    ),
    GetPage(
      name: _Paths.CATEGORY_DETAILS,
      page: () => const CategoryDetailsView(),
    ),
    GetPage(
      name: _Paths.EDIT_POSTER,
      page: () => const EditPosterView(),
    ),
    GetPage(
      name: _Paths.ADD_PROFILE,
      page: () => const AddProfileView(),
    ),
    GetPage(
      name: _Paths.POSTER_PROFILES,
      page: () => const PosterProfiles(),
    ),
    GetPage(
      name: _Paths.LANGUAGES_VIEW,
      page: () => const LanguagesView(),
    ),
    GetPage(
      name: _Paths.SELECT_PROFILE,
      page: () => const SelectProfileView(),
    ),
    GetPage(
      name: _Paths.PREVIEW_DOWNLOAD,
      page: () => const PreviewDownloadView(),
    ),
    GetPage(
      name: _Paths.LIKES,
      page: () => const LikesView(),
    ),
  ];
}
