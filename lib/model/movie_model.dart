
class TvShow {
  final String? name;
  final String? language;
  final String? summary;
  final String? imageUrl;
  final String? premiered;
  final String? rating;
  final List<String>? genres;

  TvShow(
      {required this.name,
      required this.language,
      required this.summary,
      required this.imageUrl,
      required this.premiered,
      required this.rating,
      required this.genres});

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
        name: json['name'],
        language: json['language'],
        summary: json['summary'],
        imageUrl: json['image'] != null
            ? json['image']['original']
            : 'https://source.unsplash.com/150x200/?movie',
        premiered: json['premiered'],
        genres: json['genres'] != null && json['genres'] is List
            ? List<String>.from(json['genres'])
            : ['No Genre Found'],
        rating: (json['rating']['average'] != null
            ? json['rating']['average'].toString()
            : 'No rating found'.toString()));
  }
}
