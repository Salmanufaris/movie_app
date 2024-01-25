import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/api/api.dart';
import 'package:flutter_application_movieapp/models/movies.dart';

class HomeProvider extends ChangeNotifier {
  final Api movieApiService = Api();
  List<Movies> movies = [];
  Future getHomeDAta({required url, required BuildContext context}) async {
    try {
      List<Movies> movieResults =
          await movieApiService.getMovies(apiUrl: url, context: context);
      movies = movieResults;
      notifyListeners();
      return movies;
    } catch (error) {
      Exception(error);
      notifyListeners();
    }
    notifyListeners();
  }
}
