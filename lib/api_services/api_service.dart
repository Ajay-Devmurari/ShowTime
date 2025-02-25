import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/movie_model.dart';

class ApiService {
  // Popular show ka data fetch kar ne ka url
  final String popularUrl = 'https://api.tvmaze.com/shows?page=1';

  // Upcoming show ka data fetch kar ne ka url
  final String upComingUrl = 'https://api.tvmaze.com/shows?page=2';

  // Feature show ka data fetch kar ne ka url
  final String featuredUrl = 'https://api.tvmaze.com/shows?page=3';

  // Discover show ka data fetch kar ne ka url
  final String discoverUrl = 'https://api.tvmaze.com/shows?page=4';

  Future<List<TvShow>> fetchPopularShow() async {
    final response = await http.get(Uri.parse(popularUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      final setLimitData = jsonData.take(10).toList();
      print(setLimitData);
      print(jsonData);
      return setLimitData.map((json) => TvShow.fromJson(json)).toList();
    }
    throw 'No Data Found';
  }

  Future<List<TvShow>> fetchUpcomingShow() async {
    final response = await http.get(Uri.parse(upComingUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => TvShow.fromJson(json)).toList();
    }
    throw 'No Data Found';
  }

  Future<List<TvShow>> fetchFeaturedShow() async {
    final response = await http.get(Uri.parse(featuredUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => TvShow.fromJson(json)).toList();
    }
    throw 'No Data Found';
  }

  Future<List<TvShow>> discoverShow() async {
    final response = await http.get(Uri.parse(discoverUrl));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => TvShow.fromJson(json)).toList();
    }
    throw 'No Data Found';
  }
}
