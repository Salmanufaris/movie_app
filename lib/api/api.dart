import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
        // print("Something is missing");
        // //  print("status error:- ${response.statusCode}");
        return [];
      }
    } catch (e) {
      //  print("unable to fetch data:-${e}");
      return [];
    }
  }
}
