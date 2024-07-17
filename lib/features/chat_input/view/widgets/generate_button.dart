import 'package:flutter/material.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    super.key,
    this.onTap,
    this.isLoading = false,
  });
  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        decoration: ShapeDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 113, 207, 244), BlendMode.color)),
          color: const Color.fromARGB(255, 113, 207, 244),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                width: 2, color: Color.fromARGB(255, 95, 205, 248)),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : const Text(
                    "Generate Your Article",
                    style: TextStyle(fontSize: 20),
                  )
          ],
        ),
      ),
    );
  }
}
