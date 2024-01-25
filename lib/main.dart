import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/controller/bottombar.dart';
import 'package:flutter_application_movieapp/controller/homneproveer.dart';
import 'package:flutter_application_movieapp/controller/search.dart';
import 'package:flutter_application_movieapp/widgets/bottombar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => BottomBarProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
        home: BottombarScreen(),
      ),
    );
  }
}
