import 'package:flutter/material.dart';
import 'package:showtime/api_services/api_service.dart';
import '../model/movie_model.dart';

import 'detail_screen.dart';

class DiscoverShowScreen extends StatefulWidget {
  const DiscoverShowScreen({
    super.key,
  });

  @override
  State<DiscoverShowScreen> createState() => _DiscoverShowScreenState();
}

class _DiscoverShowScreenState extends State<DiscoverShowScreen> {
  late final Future<List<TvShow>> discoverShow;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    discoverShow = ApiService().discoverShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text(
          "Discover Tv shows",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
      ),
      body: FutureBuilder(
        future: discoverShow,
        builder: (context, snapshot) {
          if (!snapshot.hasData && snapshot.hasError) {
            return const Center(child: Text("No movies found"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        snapshot: snapshot,
                        show: snapshot.data![index],
                      ),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        item.imageUrl.toString(),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
