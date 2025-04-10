import 'dart:io';

import 'package:festiva_poster/app/core/core.dart';
import 'package:festiva_poster/app/modules/editPoster/controllers/poster_controller/profile_controller.dart';
import 'package:festiva_poster/app/modules/profile/controllers/profile_controller.dart';
import 'package:festiva_poster/app/uttils/globle_uttils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../../model/global.dart';
import '../../../reusable/reusable.dart';
import '../../../routes/app_pages.dart';
import '../../../uttils/local_store/prefrances.dart';
import '../../../uttils/local_store/sql_helper.dart';

class AddProfileController extends GetxController {
//==============================================================================
// ** Properties **
//==============================================================================
  late ProfileArgument argData;
  CroppedFile? croppedFile;
  var croppedFilePath = emptyString.obs;
  var loader = false.obs;

  var personal = true.obs;
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final dbHelper = DbHelper.instance;
  var formKey = GlobalKey<FormState>();
  List<FirmData> firmData = [
    FirmData(title: LocalString.personal, isSelected: false.obs),
    FirmData(title: LocalString.business, isSelected: false.obs),
  ];

//==============================================================================
// ** Life Cycle **
//==============================================================================
  @override
  void onInit() {
    super.onInit();
    argData = Get.arguments;
    fillData();
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

  /// Manage profile type
  manageProfileIndex(int index) {
    for (var data in firmData) {
      data.isSelected(false);
    }
    firmData[index].isSelected(true);
    if (firmData[0].isSelected.value == true) {
      personal(true);
    } else {
      personal(false);
    }
  }

  /// Image Picker
  Future<void> uploadImage(context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _cropImage(pickedFile, context);
    }
  }

  /// Get Directory path
  Future<String> getApplicationDocumentsDirectoryPath() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// generate Unique Image Name
  String generateUniqueFileName() {
    DateTime now = DateTime.now();
    return 'image_${now.microsecondsSinceEpoch}.png';
  }

  /// Image Cropper
  _cropImage(XFile? pickedFile, context) async {
    if (pickedFile != null) {
      final cropFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        compressFormat: ImageCompressFormat.png,
        compressQuality: 100,
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: LocalString.festivaCropper,
            statusBarColor: AppColors.white,
            toolbarColor: AppColors.white,
            toolbarWidgetColor: AppColors.appColor,
            cropFrameColor: AppColors.white,
            backgroundColor: AppColors.white,
            activeControlsWidgetColor: AppColors.appColor,
            dimmedLayerColor: AppColors.black.withOpacity(0.5),
            hideBottomControls: false,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
          ),
        ],
      );
      if (cropFile != null) {
        croppedFile = cropFile;
        croppedFilePath.value = cropFile.path;
      }
    }
  }

  /// save logo on directory
  Future<String> savedImage(CroppedFile cropFile) async {
    final String projectDirectory =
        await getApplicationDocumentsDirectoryPath();
    final String fileName = generateUniqueFileName();
    final File newFile = File('$projectDirectory/$fileName');
    File savedImage = await newFile.writeAsBytes(await cropFile.readAsBytes());
    appPrint(savedImage.path);
    return savedImage.path;
  }

  /// Delete Images From Directory
  void deleteFile(String filePath) {
    File file = File(filePath);
    if (file.existsSync()) {
      file.deleteSync();
    }
  }

  /// Erase Images From Directory
  void eraseFile() {
    croppedFilePath('');
  }

  /// To save the data on Local DB
  Future<void> saveOnLocalDB() async {
    var savedFilepath = await savedImage(croppedFile!);
    Map<String, dynamic> row = {
      SqlTableString.logo: savedFilepath,
      SqlTableString.name: nameController.text,
      SqlTableString.mobile: mobileController.text,
      SqlTableString.email: emailController.text,
      SqlTableString.address: addressController.text,
      SqlTableString.profileType: firmData.first.isSelected.isTrue
          ? LocalString.personal
          : LocalString.business,
    };
    await dbHelper.insert(SqlTableString.profileData, row);
  }

  /// To update the data on Local DB
  Future<void> updateLocalDB() async {
    String? savedFilepath;
    if (croppedFile != null) {
      deleteFile(argData.profileData?.logo ?? emptyString);
      savedFilepath = await savedImage(croppedFile!);
    } else {
      savedFilepath = argData.profileData?.logo;
    }

    Map<String, dynamic> row = {
      SqlTableString.logo: savedFilepath,
      SqlTableString.name: nameController.text,
      SqlTableString.mobile: mobileController.text,
      SqlTableString.email: emailController.text,
      SqlTableString.address: addressController.text,
      SqlTableString.profileType: firmData.first.isSelected.isTrue
          ? LocalString.personal
          : LocalString.business,
    };
    await dbHelper.update(
        tableName: SqlTableString.profileData,
        columnName: SqlTableString.dbId,
        id: argData.profileData?.dbId ?? 1,
        row: row);
  }

  /// Fill data
  fillData() {
    if (argData.profileData != null) {
      manageProfileIndex(argData.isPersonal == true ? 0 : 1);
      croppedFilePath.value = argData.profileData?.logo ?? emptyString;
      nameController.text = argData.profileData?.name ?? emptyString;
      mobileController.text = argData.profileData?.mobile ?? emptyString;
      emailController.text = argData.profileData?.email ?? emptyString;
      addressController.text = argData.profileData?.address ?? emptyString;
    }
  }

  /// Continue Button Tap
  continueTap() async {
    if (formKey.currentState!.validate()) {
      if (firmData.first.isSelected.isTrue || firmData.last.isSelected.isTrue) {
        if (croppedFilePath.isNotEmpty) {
          await PreferenceHelper.instance.setData(Pref.firstLunch, false);

          loader(true);
          await Future.delayed(const Duration(seconds: 1)).then((value) async {
            if (argData.profileData == null) {
              await PreferenceHelper.instance.setData(Pref.selectProfile, 0);
              await saveOnLocalDB().then((value) async {
                if (argData.isOnBoarding == true) {
                  Get.offAllNamed(Routes.DASHBOARD);
                } else {
                  if (argData.isEditPoster == true) {
                    Get.put(ProfileController()).getProfileList();
                    await SelectProfileController.instance.getProfileList();
                    await SelectProfileController.instance.setInitProfile();
                    Get.offAndToNamed(Routes.SELECT_PROFILE);
                  } else {
                    Get.back();
                    Get.put(ProfileController()).getProfileList();
                  }
                }
              });
            } else {
              await updateLocalDB().then((value) {
                Get.back();
                Get.put(ProfileController()).getProfileList();
              });
            }
          });
          loader(false);
        } else {
          showToast(LocalString.logoWarning);
        }
      } else {
        showToast(LocalString.profileTypeWarning);
      }
    }
  }
}
