import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/models/cast.dart';
import 'package:flutter_application_movieapp/models/movies.dart';

class Api {
  static Dio dio = Dio();

  Future<List<Movies>> getMovies(
      {required apiUrl, required BuildContext context}) async {
    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonList = response.data;
        List<dynamic> movies = jsonList["results"];
        return movies.map((json) {
          return Movies.fromJson(json);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Movies>> searchMovie({required searchUrl}) async {
    try {
      final response = await dio.get(searchUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonList = response.data;
        List<dynamic> movies = jsonList["results"];
        return movies.map((json) {
          return Movies.fromJson(json);
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<CastModel>> getCast(
      {required castUrl, required BuildContext context}) async {
    try {
      final response = await dio.get(castUrl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        if (data.containsKey("cast")) {
          final List<dynamic> results = data["cast"];
          return results.map((cast) => CastModel.fromJson(cast)).toList();
        } else {
          throw Exception('No "cast" key in response');
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
