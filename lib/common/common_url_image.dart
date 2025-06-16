import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/views/home/cubit/home_cubit.dart';

class CommonUrlImage extends StatelessWidget {
  final int index;
  final String url;
  final double? height;
  final double? width;

  const CommonUrlImage({
    super.key,
    required this.index,
    required this.url,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.movieList != current.movieList,
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            url,
            height: height,
            width: width,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(child: CircularProgressIndicator());
            },
            errorBuilder:
                (context, error, stackTrace) => const Placeholder(
                  child: Text(
                    'Missing image.',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 183, 177),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
          ),
        );
      },
    );
  }
}
