import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_movieapp/models/movies.dart';
import 'package:flutter_application_movieapp/widgets/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static Dio dio = Dio();
  static const _trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apikey}";

  static const _topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apikey}";

  static const _upcomingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apikey}';

  static const _airUrl =
      'https://api.themoviedb.org/3/tv/popular?api_key=132c1c5352ec530ee7b7c16b1fb8fb7e';

  static const _topUrl =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=132c1c5352ec530ee7b7c16b1fb8fb7e';

  Future<List<Movies>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;

      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

  Future<List<Movies>> getTopratedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;

      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

  Future<List<Movies>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      // print(decodedData);
      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

  Future<List<Movies>> getUairMovies() async {
    final response = await http.get(Uri.parse(_airUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      // print(decodedData);
      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception("Something happened");
    }
  }

  Future<List<Movies>> getopMovies() async {
    final response = await http.get(Uri.parse(_topUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)["results"] as List;
      // print(decodedData);
      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception("Something happened");
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
        print("Something is missing");
        //  print("status error:- ${response.statusCode}");
        return [];
      }
    } catch (e) {
      //  print("unable to fetch data:-${e}");
      return [];
    }
  }
}
