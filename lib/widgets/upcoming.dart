import 'package:flutter/material.dart';
import 'package:flutter_application_movieapp/constants/constant.dart';
import 'package:flutter_application_movieapp/views/detailscreen/detail_screen.dart';

class Upcomingslider extends StatelessWidget {
  const Upcomingslider({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailesScreen(
                        id: snapshot.data[index].id,
                        movie: snapshot.data[index])));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network(
                    "${Constant.imagPath}${snapshot.data![index].posterPath}",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
