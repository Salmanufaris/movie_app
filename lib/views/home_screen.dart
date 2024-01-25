// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/constants/constant.dart';
import 'package:flutter_application_movieapp/controller/homneproveer.dart';
import 'package:flutter_application_movieapp/widgets/toprated.dart';
import 'package:flutter_application_movieapp/widgets/trending.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/netflix-removebg-preview.png",
          fit: BoxFit.cover,
          height: 140,
          filterQuality: FilterQuality.high,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Trending Movies",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: pro.getHomeDAta(
                        url: Constant.trending, context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        final data = snapshot.data;
                        return Trendingslider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Top rated movies",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: pro.getHomeDAta(
                        url: Constant.topRated, context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return Movieslider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                "Upcoming  movies",
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                child: FutureBuilder(
                    future: pro.getHomeDAta(
                        url: Constant.upComing, context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return Movieslider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
