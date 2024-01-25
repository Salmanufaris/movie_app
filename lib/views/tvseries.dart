// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/controller/homneproveer.dart';

import 'package:flutter_application_movieapp/widgets/constants.dart';
import 'package:flutter_application_movieapp/widgets/toprated.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Tvpage extends StatefulWidget {
  const Tvpage({super.key});

  @override
  State<Tvpage> createState() => _HomepageState();
}

class _HomepageState extends State<Tvpage> {
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
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Tv series",
                  style: GoogleFonts.aboreto(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: FutureBuilder(
                    future:
                        pro.getHomeDAta(url: Constant.airing, context: context),
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
                height: 20,
              ),
              SizedBox(
                child: FutureBuilder(
                    future:
                        pro.getHomeDAta(url: Constant.top, context: context),
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
            ],
          ),
        ),
      ),
    );
  }
}
