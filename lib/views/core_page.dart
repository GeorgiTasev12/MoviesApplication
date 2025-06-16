import 'package:flutter/material.dart';
import 'package:movies_app/locator.dart';
import 'package:movies_app/services/navigation.dart';

class CorePage extends StatelessWidget {
  final Widget child;
  final bool hasAppBar;
  final bool hasBackButton;
  final String? title;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;

  const CorePage({
    super.key,
    required this.child,
    this.hasAppBar = false,
    this.hasBackButton = false,
    this.title,
    this.contentPadding,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          hasAppBar
              ? AppBar(
                title: Text(title ?? '', style: TextStyle(color: Colors.white)),
                backgroundColor: Color.fromARGB(255, 126, 105, 100),
                leading: hasBackButton ? IconButton(
                  onPressed: () => locator<NavigationService>().pop(),
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ) : null,
                actions: hasAppBar ? [suffixIcon ?? Text('')] : null,
              )
              : null,
      body: Padding(
        padding: contentPadding ?? EdgeInsets.symmetric(horizontal: 10),
        child: child,
      ),
      backgroundColor: Color.fromARGB(255, 85, 71, 68),
    );
  }
}
