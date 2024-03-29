// ignore_for_file: use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/controller/bottombar_provider.dart';
import 'package:flutter_application_movieapp/views/home_screen/home_screen.dart';
import 'package:flutter_application_movieapp/views/movie_screen/movie.dart';
import 'package:flutter_application_movieapp/views/search_screen/search_screen.dart';
import 'package:flutter_application_movieapp/views/tvseries_screen/tvseries_screen.dart';
import 'package:provider/provider.dart';

class BottombarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomBarProvider>(context);

    final List<Widget> _screens = [
      const Homepage(),
      const Tvpage(),
      const Moviepage(),
      const SearchScreen(),
    ];

    return Scaffold(
      body: _screens[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.setIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: "Tvseries",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movies",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
      ),
    );
  }
}
