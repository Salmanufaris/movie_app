import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_movieapp/widgets/constants.dart';

class Movieslider extends StatelessWidget {
  const Movieslider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      "${Constant.imagPath}${snapshot.data![index].posterPath}"),
                ),
              ),
            );
          }),
    );
  }
}
