import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mkag/features/chat_input/view/widgets/article_type_container.dart';
import 'package:mkag/features/chat_input/view/widgets/chat_text_field.dart';

import 'widgets/generate_button.dart';

class ChatInputScreen extends StatelessWidget {
  const ChatInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 60),
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/logo1.png',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text("Enter Your Article Key Word"),
                    const SizedBox(
                      height: 32,
                    ),
                    const ChatTextField(),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text("Choose Your Article Type"),
                    const SizedBox(
                      height: 32,
                    ),
                    const ArticleTypeContainer(
                      iconPath: 'assets/linked.svg',
                      type: 'Linked In',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const ArticleTypeContainer(
                      iconPath: 'assets/twitter.svg',
                      type: 'Twitter',
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const ArticleTypeContainer(
                      iconPath: 'assets/article.svg',
                      type: 'MKAG Article',
                    ),
                    const SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
               SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(),
                    GenerateButton(
                      onTap: (){},
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

