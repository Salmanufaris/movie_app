import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/widgets/constants.dart';

class Trendingslider extends StatelessWidget {
  const Trendingslider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          enlargeCenterPage: true,
          pageSnapping: true,
          viewportFraction: 0.55,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
        ),
        itemBuilder: (context, itemIndex, pageviewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              height: 300,
              width: 200,
              child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  "${Constant.imagPath}${snapshot.data[itemIndex].posterPath}"),
            ),
          );
        },
      ),
    );
  }
}
