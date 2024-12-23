import 'package:flutter/material.dart';

class AppUtil {
  static double responsiveHeight(context) =>
      MediaQuery
          .sizeOf(context)
          .height;

  static double responsiveWidth(context) =>
      MediaQuery
          .sizeOf(context)
          .width;

  static Orientation orientation(context) =>
      MediaQuery
          .orientationOf(context);

  static mainNavigator(context, screen) =>
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => screen));

  static removeUntilNavigator(context, screen) =>
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => screen), (route) => false);

  static replacementNavigator(context, screen) =>
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => screen));

  static popNavigator(context, ) =>
      Navigator.of(context)
          .maybePop(context);


  static dialog2(context, title, List<Widget> dialogBody,
      {barrierDismissible = true}) async {
    return await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            title: Center(
              child: Text(
                title,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: dialogBody,
              ),
            ),
          );
        });
  }
  static SnackBar showCustomSnackWidget(String? errorMessage) {
    return SnackBar(
      padding: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      width: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Text(errorMessage!,style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        letterSpacing: -0.41,
      ),),
      backgroundColor: const Color(0xFF254642),
    );
  }

  static showCustomToast({
    required String message,
    required BuildContext context,
    Color? color,
    int time = 4,
  }) {
    var overlayEntry = OverlayEntry(
      builder: (context) =>
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color ?? Colors.black87,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(message,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14)),
                  ),
                ),
              ),
            ],
          ),
    );
  }

}