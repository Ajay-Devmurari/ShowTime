import 'package:flutter/material.dart';
import 'package:showtime/api_services/api_service.dart';

import '../model/movie_model.dart';
import '../widget/feature_show.dart';
import '../widget/popular_show.dart';
import '../widget/upcoming_show.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<TvShow>> popularShow;
  late Future<List<TvShow>> upcomingShow;
  late Future<List<TvShow>> featuredShow;

  @override
  void initState() {
    super.initState();
    popularShow = ApiService().fetchPopularShow();
    upcomingShow = ApiService().fetchUpcomingShow();
    featuredShow = ApiService().fetchFeaturedShow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Text(
          'TV Shows',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle("Popular Shows"),
            FutureBuilder(
              future: popularShow,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(
                      child: Text("Failed to load TV shows",
                          style: TextStyle(color: Colors.white70)));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text("No TV shows found",
                          style: TextStyle(color: Colors.white70)));
                }
                return PopularShow(snapshot: snapshot);
              },
            ),
            const SizedBox(height: 20),
            _buildTitle("Upcoming Shows"),
            FutureBuilder(
              future: upcomingShow,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(
                      child: Text("Failed to load TV shows",
                          style: TextStyle(color: Colors.white70)));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text("No TV shows found",
                          style: TextStyle(color: Colors.white70)));
                }
                return UpcomingShow(snapshot: snapshot);
              },
            ),
            const SizedBox(height: 20),
            _buildTitle("Featured Shows"),
            FutureBuilder(
              future: featuredShow,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return const Center(
                      child: Text("Failed to load TV shows",
                          style: TextStyle(color: Colors.white70)));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text("No TV shows found",
                          style: TextStyle(color: Colors.white70)));
                }
                return FeaturedShow(snapshot: snapshot);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 2,
            width: 100,
            color: Colors.white30,
          ),
        ],
      ),
    );
  }
}
