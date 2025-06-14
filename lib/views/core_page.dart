import 'package:flutter/material.dart';
import 'package:movies_app/locator.dart';
import 'package:movies_app/services/navigation.dart';

class CorePage extends StatelessWidget {
  final Widget child;
  final bool hasAppBar;
  final String? title;
  final EdgeInsets? contentPadding;

  const CorePage({
    super.key,
    required this.child,
    this.hasAppBar = false,
    this.title,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          hasAppBar
              ? AppBar(
                title: Text(title ?? '', style: TextStyle(color: Colors.white)),
                backgroundColor: Color.fromARGB(255, 126, 105, 100),
                leading: IconButton(
                  onPressed: () => locator<NavigationService>().pop(),
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
              )
              : null,
      body: Padding(
        padding: contentPadding ?? EdgeInsets.only(right: 10, left: 10, top: 20),
        child: child,
      ),
      backgroundColor: Color.fromARGB(255, 85, 71, 68),
    );
  }
}