// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:festiva_poster/app/core/core.dart';

import '../../model/response.dart';
import '../../uttils/globle_uttils.dart';

class DioClient {
  static final DioClient instance = DioClient._internal();

  final Dio _dio = Dio();

  final BaseOptions options = BaseOptions(
    baseUrl: Constants.baseUrl,
    connectTimeout: const Duration(seconds: 7),
    receiveTimeout: const Duration(seconds: 7),
  );

  factory DioClient() {
    return instance;
  }

  DioClient._internal() {
    _dio.options = options;
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          appPrint(error.message);
          return handler.next(error);
        },
      ),
    );
  }

  final iv = enc.IV.fromLength(8);
  final encrypt = enc.Encrypter(enc.Salsa20(enc.Key.fromLength(32)));

//==============================================================================
// ** Header Function  **
//==============================================================================

  Future<Options> _headers() async {
    return Options(
      headers: {'Content-Type': ' application/json'},
    );
  }

//==============================================================================
// ** Get call Function  **
//==============================================================================

  Future<Either<String, String>> getApi({required String url}) async {
    if (await ConnectivityWrapper.instance.isConnected) {
      try {
        var res = await _dio.get(
          url,
        );

        ResponseObject response = setResponseObject(
            res.statusCode ?? StatusCodeConstants.statusOkCode, res.data);

        if (response.type == StatusCodeConstants.success) {
          return Right(response.body!);
        } else {
          return Left(response.errorBody!);
        }
      } catch (e) {
        if (e is DioError && e.response?.statusCode == 401) {
          return Left(e.response!.toString());
        }
        if (e is DioError && e.response?.statusCode == 422) {
          return Left(e.response!.toString());
        }
        if (e is DioError && e.response?.statusCode == 304) {
          return Left(e.response!.toString());
        }
        return Left(e.toString());
      }
    } else {
      return Left(StatusCodeConstants.noInternetCode);
    }
  }

//==============================================================================
// ** Post call Function  **
//==============================================================================

  Future<Either<String, String>> postApi(
      {required String url, dynamic body}) async {
    if (await ConnectivityWrapper.instance.isConnected) {
      try {
        var res = await _dio.post(
          url,
          options: await _headers(),
          data: body,
        );
        ResponseObject response = setResponseObject(
            res.statusCode ?? StatusCodeConstants.statusOkCode,
            json.encode(res.data));
        if (response.type == StatusCodeConstants.success) {
          return Right(response.body!);
        } else {
          return Left(response.errorBody!);
        }
      } catch (e) {
        if (e is DioError && e.response?.statusCode == 401) {
          return Left(e.response!.toString());
        }
        if (e is DioError && e.response?.statusCode == 422) {
          return Left(e.response!.toString());
        }
        if (e is DioError && e.response?.statusCode == 304) {
          return Left(e.response!.toString());
        }
        return Left(e.toString());
      }
    } else {
      return Left(StatusCodeConstants.noInternetCode);
    }
  }

//==============================================================================
// ** Put call Function  **
//==============================================================================

  Future<Either<String, String>> putApi(
      {required String url, String? body}) async {
    if (await ConnectivityWrapper.instance.isConnected) {
      try {
        var res = await _dio.put(url, options: await _headers());
        if (res.statusCode == 201 ||
            res.statusCode == 202 ||
            res.statusCode == 204) {
          return const Right('Success');
        } else {
          return const Left('Fail');
        }
      } catch (e) {
        if (e is DioError && e.response?.statusCode == 401) {
          return Left(e.response!.toString());
        }
        if (e is DioError && e.response?.statusCode == 422) {
          return Left(e.response!.toString());
        }
        if (e is DioError && e.response?.statusCode == 304) {
          return Left(e.response!.toString());
        }
        return Left(e.toString());
      }
    } else {
      return Left(StatusCodeConstants.noInternetCode);
    }
  }

//==============================================================================
// ** Delete call Function  **
//==============================================================================

  Future<Either<String, String>> deleteApi({required String url}) async {
    if (await ConnectivityWrapper.instance.isConnected) {
      try {
        var res = await _dio.delete(url, options: await _headers());

        if (res.statusCode == 201 ||
            res.statusCode == 202 ||
            res.statusCode == 204) {
          return const Right('Success');
        } else {
          return const Left('Fail');
        }
      } catch (e) {
        if (e is DioError && e.response?.statusCode == 401) {
          return Left(e.response!.toString());
        }
        if (e is DioError && e.response?.statusCode == 422) {
          return Left(e.response!.toString());
        }
        if (e is DioError && e.response?.statusCode == 304) {
          return Left(e.response!.toString());
        }
        return Left(e.toString());
      }
    } else {
      return Left(StatusCodeConstants.noInternetCode);
    }
  }

//==============================================================================
// ** Manage Response call Function  **
//==============================================================================

  ResponseObject setResponseObject(
    int statusCode,
    String body,
  ) {
    try {
      if (StatusCodeConstants.badRequestCodes.contains(statusCode)) {
        return ResponseObject(
            type: StatusCodeConstants.badRequest,
            statusCode: statusCode,
            body: emptyString,
            errorBody: body);
      } else if (StatusCodeConstants.authorityCodes.contains((statusCode))) {
        return ResponseObject(
            type: StatusCodeConstants.authority,
            statusCode: statusCode,
            body: emptyString,
            errorBody: body);
      } else if (StatusCodeConstants.errorCodes.contains(statusCode)) {
        return ResponseObject(
            type: StatusCodeConstants.error,
            statusCode: statusCode,
            body: emptyString,
            errorBody: body);
      } else if (StatusCodeConstants.notFoundCode.contains(statusCode)) {
        return ResponseObject(
            type: StatusCodeConstants.notFound,
            statusCode: statusCode,
            body: emptyString,
            errorBody: body);
      } else if (StatusCodeConstants.successCodes.contains(statusCode)) {
        return ResponseObject(
          type: StatusCodeConstants.success,
          statusCode: statusCode,
          errorBody: emptyString,
          body: body,
        );
      }
    } catch (e) {
      return ResponseObject(
          statusCode: statusCode,
          body: emptyString,
          type: StatusCodeConstants.none,
          errorBody: body);
    }

    return ResponseObject(
        type: StatusCodeConstants.statusOk,
        statusCode: StatusCodeConstants.statusOkCode,
        body: emptyString,
        errorBody: emptyString);
  }
}
