import 'package:dartz/dartz.dart';

import '../../model/response/catagory_data.dart';
import '../../model/response/home_poster_data.dart';
import '../../model/response/poster_details.dart';
import 'dio_client.dart';

class DataProvider {
  DataProvider({required DioClient dioClient}) : _dioClient = dioClient;
  final DioClient _dioClient;

  // API call for get Home poster
  Future<Either<String, HomePoster>> getHomePoster() async {
    var response = await _dioClient.getApi(
      url: '/flyer.html',
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(homePosterFromJson(r)),
    );
  }

  // API call for Get poster Details
  Future<Either<String, PosterDetails>> getPosterDetails(
      {required String url}) async {
    var response = await _dioClient.getApi(
      url: url,
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(posterDetailsFromJson(r)),
    );
  }

  Future<Either<String, CatagoryModel>> getCatagoryList() async {
    var response = await _dioClient.getApi(
      url: '/flyercat19.html',
    );
    return response.fold(
      (l) => Left(l),
      (r) => Right(catagoryModelFromJson(r)),
    );
  }
}
