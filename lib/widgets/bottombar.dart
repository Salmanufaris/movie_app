import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/controller/bottombar.dart';
import 'package:flutter_application_movieapp/views/home_screen.dart';
import 'package:flutter_application_movieapp/views/movie.dart';
import 'package:flutter_application_movieapp/views/search.dart';
import 'package:flutter_application_movieapp/views/tvseries.dart';
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
