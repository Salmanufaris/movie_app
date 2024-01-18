import 'dart:convert';

import 'package:flutter_application_movieapp/models/movies.dart';
import 'package:flutter_application_movieapp/widgets/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apikey}";

  static const _topRatedgUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apikey}";

  static const _upcomingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apikey}";

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
    final response = await http.get(Uri.parse(_topRatedgUrl));
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
}
