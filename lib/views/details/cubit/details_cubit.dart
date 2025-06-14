import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/dio/movie_details.dart';
import 'package:movies_app/repositories/movie_repository.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsState());

  Future<void> getMovieDetails(String id) async {
    final movieDetails = await MovieRepository().getMovieDetailsById(id);

    emit(state.copyWith(movieDetails: movieDetails));
  }

  String? averageRatings(String index) {
    final ratings = state.movieDetails?.ratings;

    if (ratings?.isEmpty ?? false) return '';
    final result =
        (ratings?.reduce((a, b) => a + b) ?? 0) / (ratings?.length ?? 0);

    return result.toStringAsFixed(1);
  }
}
