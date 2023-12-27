import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatResponseScreen extends StatelessWidget {
  const ChatResponseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/logo1.png',
                  width: 50,
                  height: 50,
                ),
                const SizedBox(
                  height: 88,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A0000),
                    border: Border.all(
                      color:
                          const Color(0xFFFF3BFF), // Set border color to pink
                      width: 2.0, // Set border width (adjust as needed)
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0), // Set the border radius to 8
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/twitter.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            "Twitter",
                            style: TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "This topic explores the advancements in renewable energy technologies like solar, wind, hydro, and geothermal power. It discusses how these technologies have evolved over time and their role in promoting global sustainability by reducing carbon footprints, creating green jobs, and leading towards a more sustainable future. The text could delve into the challenges and opportunities presented by renewable energy, its economic impacts, and the policies required to support its growth.",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
