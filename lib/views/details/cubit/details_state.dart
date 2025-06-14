part of 'details_cubit.dart';

final class DetailsState extends Equatable {
  final MovieDetails? movieDetails;

  const DetailsState({this.movieDetails});

  DetailsState copyWith({MovieDetails? movieDetails}) {
    return DetailsState(
      movieDetails: movieDetails ?? this.movieDetails,
    );
  }

  @override
  List<Object?> get props => [movieDetails];
}
