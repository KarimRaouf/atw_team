import 'package:flutter/material.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    super.key, this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 32, vertical: 24),
        decoration: ShapeDecoration(
          color: Colors.black,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                width: 2, color: Color(0xFFFF3BFF)),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Generate Your Article",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
