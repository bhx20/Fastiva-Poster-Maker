import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/routes/app_pages.dart';
import 'package:gal/gal.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../model/global.dart';
import '../../../reusable/globle_widget.dart';
import '../../../uttils/local_store/sql_helper.dart';

class PreviewDownloadController extends GetxController {
  var isDownloading = false.obs;
  late DownloadArgument downloadArgument;

  final dbHelper = DbHelper.instance;
  @override
  void onInit() {
    super.onInit();
    downloadArgument = Get.arguments;
  }

  List<PreviewIcon> previewList = [
    PreviewIcon(
      icon: AppIcon.share,
    ),
    PreviewIcon(
      icon: AppIcon.home,
    ),
    PreviewIcon(
      icon: AppIcon.downloadImage,
    ),
  ];

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  shareTap() async {
    await Share.shareXFiles([XFile(downloadArgument.imagePath ?? emptyString)],
        text: "${LocalString.title} \n ${Constants.playStoreUrl}");
  }

  homeTap() {
    Get.offAllNamed(Routes.DASHBOARD);
  }

  downloadImage() async {
    isDownloading(true);
    await Gal.putImageBytes(
      downloadArgument.byte!.buffer.asUint8List(),
    );
    isDownloading(false);
    showToast(LocalString.downloadSuccessful);
    Get.offAllNamed(Routes.DASHBOARD, arguments: 3);
  }
}
