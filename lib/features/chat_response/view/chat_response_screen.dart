import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatResponseScreen extends StatelessWidget {
  const ChatResponseScreen(
      {super.key, required this.content, required this.type});
  final String content;
  final int type;
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
                          type == 0
                              ? SvgPicture.asset('assets/linked.svg')
                              : type == 1
                                  ? SvgPicture.asset('assets/twitter.svg')
                                  : SvgPicture.asset('assets/article.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                           Text(
                           type==0?"Linked In" :type==1?  "Twitter": "MKAG Article",
                            style: const TextStyle(fontSize: 24),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        content,
                        style: const TextStyle(fontSize: 16),
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
