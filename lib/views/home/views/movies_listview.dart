import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/common_url_image.dart';
import 'package:movies_app/locator.dart';
import 'package:movies_app/services/navigation.dart';
import 'package:movies_app/views/details/cubit/details_cubit.dart';
import 'package:movies_app/views/details/details_page.dart';
import 'package:movies_app/views/home/cubit/home_cubit.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Color.fromARGB(255, 126, 105, 100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: CommonUrlImage(
                      index: index,
                      url: state.movieList?[index].posterUrl ?? '',
                      width: 150,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.movieList?[index].title ?? 'No Title',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star_rate_sharp,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${context.read<HomeCubit>().averageRatings(index)}",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.amber,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
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
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemCount: state.movieList?.length ?? 0,
        );
      },
    );
  }
}
