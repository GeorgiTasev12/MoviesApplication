import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movies_app/common/common_details_listitle.dart';
import 'package:movies_app/common/common_url_image.dart';
import 'package:movies_app/views/core_page.dart';
import 'package:movies_app/views/details/cubit/details_cubit.dart';

class DetailsPage extends HookWidget {
  final String? movieId;

  const DetailsPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailsCubit>();

    useEffect(() {
      cubit.getMovieDetails(movieId ?? '');
      return null;
    }, []);

    return BlocBuilder<DetailsCubit, DetailsState>(
      buildWhen:
          (previous, current) => previous.movieDetails != current.movieDetails,
      builder: (context, state) {
        return CorePage(
          hasAppBar: true,
          hasBackButton: true,
          title: state.movieDetails?.title ?? '',
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListView(
            children: [
              CommonDetailsListTile(
                hasLeadingIcon: true,
                leadingIcon: Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amberAccent,
                  size: 21,
                ),
                subtitle: '${cubit.averageRatings(movieId ?? '') ?? ''} / 10',
                subtitleStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CommonUrlImage(
                index: int.parse(movieId ?? ''),
                url: state.movieDetails?.posterUrl ?? '',
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  CommonDetailsListTile(
                    title: 'Genres:',
                    subtitle: state.movieDetails?.genres.join(', ') ?? '',
                  ),
                  const Divider(thickness: 1, color: Colors.white54),
                  CommonDetailsListTile(
                    title: 'Release Date:',
                    subtitle: state.movieDetails?.releaseDate ?? '',
                  ),
                  const Divider(thickness: 1, color: Colors.white54),
                  CommonDetailsListTile(
                    title: 'Storyline:',
                    subtitle: state.movieDetails?.storyline ?? '',
                  ),
                  const Divider(thickness: 1, color: Colors.white54),
                  CommonDetailsListTile(
                    title: 'Actors:',
                    subtitle: state.movieDetails?.actors.join(', ') ?? '',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
