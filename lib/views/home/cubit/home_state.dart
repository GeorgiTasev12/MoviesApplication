part of 'home_cubit.dart';

final class HomeState extends Equatable {
  final List<Movie>? movieList;
  final String? imageUrl;
  final double? averageRating;
  final bool isViewSwitched;

  const HomeState({
    this.movieList,
    this.imageUrl,
    this.averageRating,
    this.isViewSwitched = false,
  });

  HomeState copyWith({
    List<Movie>? movieList,
    String? imageUrl,
    double? averageRating,
    bool? isViewSwitched,
  }) {
    return HomeState(
      movieList: movieList ?? this.movieList,
      imageUrl: imageUrl ?? this.imageUrl,
      averageRating: averageRating ?? this.averageRating,
      isViewSwitched: isViewSwitched ?? this.isViewSwitched,
    );
  }

  @override
  List<Object?> get props => [
    movieList,
    imageUrl,
    averageRating,
    isViewSwitched,
  ];
}
