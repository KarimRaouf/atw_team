import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter keyword',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.30),
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
