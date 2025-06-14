class MovieDetails {
  final String title;
  final List<int> ratings;
  final List<String> genres;
  final String releaseDate;
  final String storyline;
  final List<String> actors;
  final String posterUrl;

  MovieDetails({
    required this.title,
    required this.ratings,
    required this.genres,
    required this.releaseDate,
    required this.storyline,
    required this.actors,
    required this.posterUrl,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      title: json['title'] ?? '',
      ratings: List<int>.from(json['ratings'] ?? []),
      genres: List<String>.from(json['genres'] ?? []),
      releaseDate: json['releaseDate'] ?? '',
      storyline: json['storyline'] ?? '',
      actors: List<String>.from(json['actors'] ?? []),
      posterUrl: json['posterurl'] ?? '',
    );
  }
}
