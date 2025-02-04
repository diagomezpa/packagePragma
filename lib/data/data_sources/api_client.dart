import 'dart:convert';

import 'package:fake_maker_api_pragma_api/core/error/failures.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class ApiClient {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<Either<Failure, List<T>>> fetchList<T>(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (data != null) {
          List<T> items = [];
          for (var item in data) {
            items.add(fromJson(item));
          }

          return Right(items);
        } else {
          return Left(ServerFailure('Failed to load data: Data is null'));
        }
      } else {
        return Left(
            ServerFailure('Failed to load data: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(NetworkFailure('Failed to load data: $e'));
    }
  }

  Future<Either<Failure, T>> fetchItem<T>(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        T item = fromJson(data);
        return Right(item);
      } else {
        return Left(
            ServerFailure('Failed to load data: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(NetworkFailure('Failed to load data: $e'));
    }
  }

  Future<Either<Failure, T>> createItem<T>(
      String endpoint,
      Map<String, dynamic> item,
      T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(item),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        if (data.length == 1) {
          data = {...item, 'id': data['id']};
        } else {}
        T newItem = fromJson(data);

        return Right(newItem);
      } else {
        return Left(
            ServerFailure('Failed to create item: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(NetworkFailure('Failed to create item: $e'));
    }
  }

  Future<Either<Failure, T>> deleteItem<T>(
      String endpoint, T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl$endpoint'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        T item = fromJson(data);
        return Right(item);
      } else {
        return Left(
            ServerFailure('Failed to delete item: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(NetworkFailure('Failed to delete item: $e'));
    }
  }

  Future<Either<Failure, T>> updateItem<T>(
      String endpoint,
      Map<String, dynamic> item,
      T Function(Map<String, dynamic>) fromJson) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(item),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        T updatedItem = fromJson(data);
        return Right(updatedItem);
      } else {
        return Left(
            ServerFailure('Failed to update item: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(NetworkFailure('Failed to update item: $e'));
    }
  }
}
