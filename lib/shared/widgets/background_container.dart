import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(tileMode: TileMode.mirror ,colors:[Color(0xFF254642),Color(0xFF141414)]),
      ),
      child: child,
    );
  }
}
