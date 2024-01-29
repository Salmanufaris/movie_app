import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/service/api.dart';
import 'package:flutter_application_movieapp/constants/constant.dart';
import 'package:flutter_application_movieapp/models/movies.dart';

class SearchProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  List<Movies> searchedResult = [];
  final Api apiServices = Api();

  void searchMovies(String query) async {
    if (query.isNotEmpty) {
      try {
        final searchUrl =
            "https://api.themoviedb.org/3/search/movie?query=$query&api_key=${Constant.apikey}";
        List<Movies> movies =
            await apiServices.searchMovie(searchUrl: searchUrl);

        searchedResult = movies;
        notifyListeners();
      } catch (e) {
        // print("Error: $e");
        Exception(e);
        notifyListeners();
      }
    } else {
      searchedResult = [];
      notifyListeners();
    }
  }
}
