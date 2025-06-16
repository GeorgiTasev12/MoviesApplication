import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movies_app/views/core_page.dart';
import 'package:movies_app/views/home/cubit/home_cubit.dart';
import 'package:movies_app/views/home/views/movies_gridview.dart';
import 'package:movies_app/views/home/views/movies_listview.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    useEffect(() {
      cubit.getMovies();
      return null;
    }, []);

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (previous, current) =>
              previous.movieList != current.movieList ||
              previous.isViewSwitched != current.isViewSwitched,
      builder: (context, state) {
        return CorePage(
          hasAppBar: true,
          title: 'Movie App',
          suffixIcon: IconButton(
            onPressed: () => cubit.switchViews(),
            icon: Icon(
              state.isViewSwitched ? Icons.window_outlined : Icons.list,
              color: Colors.white,
            ),
          ),
          child:
              (state.movieList?.isEmpty ?? false)
                  ? Center(
                    child: const CircularProgressIndicator(
                      backgroundColor: Colors.blue,
                    ),
                  )
                  : RefreshIndicator(
                    onRefresh: () async => cubit.getMovies(),
                    color: Color.fromARGB(255, 126, 105, 100),
                    child:
                        state.isViewSwitched
                            ? MoviesListView()
                            : MoviesGridView(),
                  ),
        );
      },
    );
  }
}
