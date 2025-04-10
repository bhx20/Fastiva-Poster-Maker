import 'package:dartz/dartz.dart';
import 'package:festiva_poster/app/data/repo/repo_impliment.dart';

import '../../model/response/catagory_data.dart';
import '../../model/response/home_poster_data.dart';
import '../../model/response/poster_details.dart';
import '../network/data_provider.dart';
import '../network/dio_client.dart';

class ServerDataRepo {
  static ServerDataRepoImpl getInstance() {
    return ServerDataRepoImpl(
      dataProvider: DataProvider(dioClient: DioClient.instance),
    );
  }
}

abstract class ServerDataRepository {
  Future<Either<String, HomePoster>> getHomePoster();
  Future<Either<String, PosterDetails>> getPosterDetails({required String url});
  Future<Either<String, CatagoryModel>> getCatagoryList();
}
