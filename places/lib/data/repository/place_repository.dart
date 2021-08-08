import 'package:dio/dio.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/search_model.dart';
import 'package:places/service/network_exception.dart';

class PlaceRepository {
  final Dio dio;

  PlaceRepository(this.dio);

  Future<List<Place>> getPlaceList(SearchModel model) async {
    try {
      final params = <String, dynamic>{};
      if (model.count != null) params['count'] = model.count;
      if (model.offset != null) params['offset'] = model.offset;
      if (model.pageBy != null) params['pageBy'] = model.pageBy;
      if (model.pageAfter != null) params['pageAfter'] = model.pageAfter;
      if (model.pagePrior != null) params['pagePrior'] = model.pagePrior;
      if (model.sortBy != null) params['sortBy'] = model.sortBy;
      final response = await dio.get<List<dynamic>>(
        '/place',
        queryParameters: params,
      );

      final result = <Place>[];
      for (final data in response.data!) {
        result.add(Place.fromJson(data as Map<String, dynamic>));
      }

      return result;
    } on DioError catch (error) {
      throw NetworkException.fromDioError(error);
    }
  }

  Future<Place> getPlace(int id) async {
    try {
      final params = {'id': id};
      final response =
          await dio.get<dynamic>('/place', queryParameters: params);

      return Place.fromJson(response as Map<String, dynamic>);
    } on DioError catch (error) {
      throw NetworkException.fromDioError(error);
    }
  }

  Future<Place> deletePlace(int id) async {
    try {
      final params = {'id': id};
      final response =
          await dio.delete<dynamic>('/place', queryParameters: params);

      return Place.fromJson(response as Map<String, dynamic>);
    } on DioError catch (error) {
      throw NetworkException.fromDioError(error);
    }
  }

  Future<Place> updatePlace(int id, Place place) async {
    try {
      final params = {'id': id};
      final body = place.toJson();
      final response = await dio.put<dynamic>(
        '/place',
        queryParameters: params,
        data: body,
      );

      return Place.fromJson(response as Map<String, dynamic>);
    } on DioError catch (error) {
      throw NetworkException.fromDioError(error);
    }
  }

  Future<Place> createPlace(Place place) async {
    try {
      final body = place.toJson();
      final response = await dio.put<dynamic>(
        '/place',
        data: body,
      );

      return Place.fromJson(response as Map<String, dynamic>);
    } on DioError catch (error) {
      throw NetworkException.fromDioError(error);
    }
  }
}
