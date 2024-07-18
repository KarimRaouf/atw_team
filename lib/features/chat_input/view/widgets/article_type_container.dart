import 'package:flutter/material.dart';

class ArticleTypeContainer extends StatelessWidget {
  const ArticleTypeContainer({
    super.key,
    required this.text,
    required this.index,
    required this.onTap,
    this.isSelected = false,
  });
  final String? text;
  final int index;
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 131,
        // padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
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
              '$text',
              style: TextStyle(
                  fontSize: 10,
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