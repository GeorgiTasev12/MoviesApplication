part of 'home_cubit.dart';

final class HomeState extends Equatable {
  final List<Movie>? movieList;
  final String? imageUrl;
  final double? averageRating;

  const HomeState({this.movieList, this.imageUrl, this.averageRating});

  HomeState copyWith({
    List<Movie>? movieList,
    String? imageUrl,
    double? averageRating,
  }) {
    return HomeState(
      movieList: movieList ?? this.movieList,
      imageUrl: imageUrl ?? this.imageUrl,
      averageRating: averageRating ?? this.averageRating,
    );
  }

  @override
  List<Object?> get props => [movieList, imageUrl, averageRating];
}
