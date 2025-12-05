import 'package:flutter/material.dart';

/// Simple circular icon button for social logins
class SocialCircle extends StatelessWidget {
  final String image;

  const SocialCircle({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 38, height: 38, child: Image.asset(image));
  }
}
