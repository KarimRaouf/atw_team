import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleTypeContainer extends StatelessWidget {
  const ArticleTypeContainer({
    super.key,
    required this.iconPath,
    required this.type,
  });
  final String iconPath;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: ShapeDecoration(
        color: Colors.black,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(iconPath),
          const SizedBox(
            width: 20,
          ),
          Text(
            type,
            style: const TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}