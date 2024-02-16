import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/service/api.dart';
import 'package:flutter_application_movieapp/models/movies.dart';

class HomeProvider extends ChangeNotifier {
  final Api movieApiService = Api();

  Future getHomeDAta({required url, required BuildContext context}) async {
    List<Movies> movies = [];
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
