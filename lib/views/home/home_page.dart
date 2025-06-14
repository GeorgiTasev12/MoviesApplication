import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movies_app/common/common_url_image.dart';
import 'package:movies_app/views/core_page.dart';
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

    return CorePage(
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen:
            (previous, current) => previous.movieList != current.movieList,
        builder: (context, state) {
          return (state.movieList?.isEmpty ?? false)
              ? Center(
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                ),
              )
              : ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      top: 20,
                    ),
                    child: ListTile(
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
                              Icon(Icons.star_rate_sharp, color: Colors.amber),
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
                          CommonUrlImage(index: index),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder:
                    (context, index) => const SizedBox(height: 12),
                itemCount: state.movieList?.length ?? 0,
              );
        },
      ),
    );
  }
}