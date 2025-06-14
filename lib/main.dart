import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/locator.dart';
import 'package:movies_app/services/navigation.dart';
import 'package:movies_app/views/home/cubit/home_cubit.dart';
import 'package:movies_app/views/home/home_page.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(), 
      child: HomePage(),
    );
  }
}
