import 'package:flutter/material.dart';

class CorePage extends StatelessWidget {
  final Widget child;
  final bool hasAppBar;

  const CorePage({
    super.key, 
    required this.child, 
    this.hasAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: hasAppBar 
          ? AppBar(title: const Text('Core Page')) 
          : null,
        body: child,
      ),
    );
  }
}