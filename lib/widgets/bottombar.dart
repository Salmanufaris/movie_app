import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/views/home_screen.dart';
import 'package:flutter_application_movieapp/views/movie.dart';
import 'package:flutter_application_movieapp/views/search.dart';
import 'package:flutter_application_movieapp/views/tvseries.dart';

class BottombarScreen extends StatefulWidget {
  const BottombarScreen({super.key});

  @override
  State<BottombarScreen> createState() => _BottombarScreenState();
}

class _BottombarScreenState extends State<BottombarScreen> {
  int _currentIndex = 0;
  final List _screens = [
    const Homepage(),
    const Tvpage(),
    const Moviepage(),
    const SearchScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
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
            label: "search",
          ),
        ],
      ),
    );
  }
}
