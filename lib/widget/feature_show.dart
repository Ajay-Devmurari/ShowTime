import 'package:flutter/material.dart';

import '../screen/detail_screen.dart';

class FeaturedShow extends StatelessWidget {
  FeaturedShow({super.key, required this.snapshot});

  AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    return SizedBox(
      height: ht * 0.3,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data.length,
          itemBuilder: (context, index) {
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
                    item.imageUrl.toString(),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
