class Movie {
  final String? id;
  final String title;
  final List<int> ratings;
  final String posterUrl;

  Movie({
    required this.id,
    required this.title, 
    required this.ratings, 
    required this.posterUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      ratings: List<int>.from(json['ratings'] ?? []),
      posterUrl: json['posterurl'] ?? '',
    );
  }
}
