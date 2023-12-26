import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleTypeContainer extends StatelessWidget {
  const ArticleTypeContainer({
    super.key,
    required this.iconPath,
    required this.type,
    required this.onTap,
    this.isSelected = false,
  });
  final String iconPath;
  final String type;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 0.50,
                color: isSelected ? Color(0xFFFF3BFF) : Colors.white),
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
              style: TextStyle(
                  fontSize: 24,
                  color: isSelected ? Color(0xFF7A309F) : Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
