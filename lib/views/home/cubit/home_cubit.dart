import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/dio/movie.dart';
import 'package:movies_app/repositories/movie_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());

  Future<void> getMovies() async {
    final list = await MovieRepository().getMovies();

    emit(state.copyWith(movieList: list));
  }

  String? averageRatings(int index) {
    final ratings = state.movieList?[index].ratings;

    if (ratings?.isEmpty ?? false) return '';
    final result =
        (ratings?.reduce((a, b) => a + b) ?? 0) / (ratings?.length ?? 0);

    return result.toStringAsFixed(1);
  }
}
