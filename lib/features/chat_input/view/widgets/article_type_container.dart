import 'package:flutter/material.dart';

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
                width: 3,
                color: isSelected
                    ? const Color.fromARGB(255, 148, 220, 248)
                    : Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type,
              style: TextStyle(
                  fontSize: 24,
                  color: isSelected
                      ? const Color.fromARGB(255, 95, 205, 248)
                      : Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
