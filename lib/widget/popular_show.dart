import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../screen/detail_screen.dart';

class PopularShow extends StatelessWidget {
  const PopularShow({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    return SizedBox(
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: snapshot.data.length,
          options: CarouselOptions(
              enlargeFactor: 0.5,
              scrollPhysics: const CarouselScrollPhysics(),
              autoPlay: true,
              height: ht * 0.4,
              enlargeCenterPage: true,
              pageSnapping: true,
              disableCenter: true,
              autoPlayAnimationDuration: const Duration(seconds: 2),
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 0.68),
          itemBuilder: (context, index, pageViewIndex) {
            final item = snapshot.data[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      snapshot: snapshot,
                      show: snapshot.data[index],
                    ),
                  )),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    // height: 200,
                    item.imageUrl.toString(),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
