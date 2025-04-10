import 'package:dartz/dartz.dart';
import 'package:festiva_poster/app/data/repo/repo.dart';
import 'package:festiva_poster/app/model/response/catagory_data.dart';
import 'package:festiva_poster/app/model/response/home_poster_data.dart';
import 'package:festiva_poster/app/model/response/poster_details.dart';

import '../network/data_provider.dart';

class ServerDataRepoImpl extends ServerDataRepository {
  ServerDataRepoImpl({required DataProvider dataProvider})
      : _dataProvider = dataProvider;

  final DataProvider _dataProvider;

  @override
  Future<Either<String, HomePoster>> getHomePoster() {
    return _dataProvider.getHomePoster();
  }

  @override
  Future<Either<String, PosterDetails>> getPosterDetails(
      {required String url}) {
    return _dataProvider.getPosterDetails(url: url);
  }

  @override
  Future<Either<String, CatagoryModel>> getCatagoryList() {
    return _dataProvider.getCatagoryList();
  }
}
