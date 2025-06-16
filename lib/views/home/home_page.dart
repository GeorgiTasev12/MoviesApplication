import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movies_app/common/common_url_image.dart';
import 'package:movies_app/locator.dart';
import 'package:movies_app/services/navigation.dart';
import 'package:movies_app/views/core_page.dart';
import 'package:movies_app/views/details/cubit/details_cubit.dart';
import 'package:movies_app/views/details/details_page.dart';
import 'package:movies_app/views/home/cubit/home_cubit.dart';

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
                  : state.isViewSwitched
                  ? ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: Color.fromARGB(255, 126, 105, 100),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        title: Text(
                          state.movieList?[index].title ?? 'No Title',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star_rate_sharp,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "${cubit.averageRatings(index)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Flexible(
                              child: CommonUrlImage(
                                index: index,
                                url: state.movieList?[index].posterUrl ?? '',
                                height: 250,
                              ),
                            ),
                          ],
                        ),
                        onTap:
                            () => locator<NavigationService>().push(
                              MaterialPageRoute(
                                builder:
                                    (_) => BlocProvider(
                                      create: (context) => DetailsCubit(),
                                      child: DetailsPage(
                                        movieId: state.movieList?[index].id,
                                      ),
                                    ),
                              ),
                            ),
                      );
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 12),
                    itemCount: state.movieList?.length ?? 0,
                  )
                  : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Color.fromARGB(255, 126, 105, 100),
                        child: InkWell(
                          onTap:
                              () => locator<NavigationService>().push(
                                MaterialPageRoute(
                                  builder:
                                      (_) => BlocProvider(
                                        create: (context) => DetailsCubit(),
                                        child: DetailsPage(
                                          movieId: state.movieList?[index].id,
                                        ),
                                      ),
                                ),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 9,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.movieList?[index].title ?? 'No Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_rate_sharp,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "${cubit.averageRatings(index)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white70,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  child: Center(
                                    child: CommonUrlImage(
                                      index: index,
                                      url:
                                          state.movieList?[index].posterUrl ??
                                          '',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
        );
      },
    );
  }
}
