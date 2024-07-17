import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter_svg/flutter_svg.dart';
>>>>>>> voice_document

class ArticleTypeContainer extends StatelessWidget {
  const ArticleTypeContainer({
    super.key,
<<<<<<< HEAD
    required this.text,
    required this.index,
    required this.onTap,
    this.isSelected = false,
  });
  final String? text;
  final int index;
=======
    required this.iconPath,
    required this.type,
    required this.onTap,
    this.isSelected = false,
  });
  final String iconPath;
  final String type;
>>>>>>> voice_document
  final Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
<<<<<<< HEAD
        height: 50,
        width: 131,
        // padding: const EdgeInsets.symmetric(horizontal: 42, vertical: 16),
=======
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
>>>>>>> voice_document
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 3,
                color: isSelected
<<<<<<< HEAD
                    ? const Color.fromARGB(255, 148, 220, 248)
=======
                    ? const Color.fromARGB(255, 95, 205, 248)
>>>>>>> voice_document
                    : Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
<<<<<<< HEAD
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$text',
              style: TextStyle(
                  fontSize: 10,
=======
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(
              width: 20,
            ),
            Text(
              type,
              style: TextStyle(
                  fontSize: 24,
>>>>>>> voice_document
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
