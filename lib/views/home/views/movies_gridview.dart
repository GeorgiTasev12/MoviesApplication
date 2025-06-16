import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/common_url_image.dart';
import 'package:movies_app/locator.dart';
import 'package:movies_app/services/navigation.dart';
import 'package:movies_app/views/details/cubit/details_cubit.dart';
import 'package:movies_app/views/details/details_page.dart';
import 'package:movies_app/views/home/cubit/home_cubit.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return GridView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: state.movieList?.length,
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
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star_rate_sharp,
                            color: Colors.amber,
                            size: 19,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "${context.read<HomeCubit>().averageRatings(index)}",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.amber,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Center(
                          child: CommonUrlImage(
                            index: index,
                            url: state.movieList?[index].posterUrl ?? '',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
