import 'package:dio/dio.dart';
import 'package:places/data/model/place.dart';
import 'package:places/service/network_exception.dart';

class PlaceRepository {
  final Dio dio;

  PlaceRepository(this.dio);

  Future<List<Place>> getPlaceList({
    int? count,
    int? offset,
    String? pageBy,
    String? pageAfter,
    String? pagePrior,
    List<String>? sortBy,
  }) async {
    try {
      final params = <String, dynamic>{};
      if (count != null) params['count'] = count;
      if (offset != null) params['offset'] = offset;
      if (pageBy != null) params['pageBy'] = pageBy;
      if (pageAfter != null) params['pageAfter'] = pageAfter;
      if (pagePrior != null) params['pagePrior'] = pagePrior;
      if (sortBy != null) params['sortBy'] = sortBy;
      final response = await dio.get<List<dynamic>>(
        '/place',
        queryParameters: params,
      );

      if (response.data != null) {
        return ((response.data)!)
            .map((dynamic e) => Place.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        return [];
      }
    } on DioError catch (error) {
      throw NetworkException.fromDioError(error);
    }
  }

  Future<Place> getPlace(int id) async {
    try {
      final params = <String, dynamic>{'id': id};
      final response =
          await dio.get<dynamic>('/place', queryParameters: params);

      return Place.fromJson(response as Map<String, dynamic>);
    } on DioError catch (error) {
      throw NetworkException.fromDioError(error);
    }
  }

  Future<Place> deletePlace(int id) async {
    try {
      final params = <String, dynamic>{'id': id};
      final response =
          await dio.delete<dynamic>('/place', queryParameters: params);

      return Place.fromJson(response as Map<String, dynamic>);
    } on DioError catch (error) {
      throw NetworkException.fromDioError(error);
    }
  }

  Future<Place> updatePlace(int id, Place place) async {
    try {
      final params = <String, dynamic>{'id': id};
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
