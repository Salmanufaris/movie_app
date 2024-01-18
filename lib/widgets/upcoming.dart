import 'package:flutter/material.dart';

class Upcomingslider extends StatelessWidget {
  const Upcomingslider({
    super.key,
  });

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
                child: Container(
                  height: 200,
                  width: 150,
                  color: Colors.amber,
                ),
              ),
            );
          }),
    );
  }
}
