import 'package:flutter/material.dart';
import 'package:movies_app/views/core_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CorePage(
      child: ListView.separated(
        itemBuilder: (_, index) {
          return ListTile(
            title: Text('Movie $index'),
            subtitle: Text('Subtitle for movie $index'),
          );
        },
        separatorBuilder: (_, index) => const SizedBox(height: 8), 
        itemCount: 20),
    );
  }
}