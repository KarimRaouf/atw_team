import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_cubit.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_state.dart';

class ChatResponseScreen extends StatelessWidget {
  const ChatResponseScreen(
      {super.key, required this.content, required this.type});
  final String content;
  final int type;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (cubit) {
        ChatInputCubit().searchController.clear();
        print(ChatInputCubit().searchController);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(
                    'assets/atwlogo.png',
                    width: 200,
                    height: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ResponseContainer(type: type, content: content)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ResponseContainer extends StatelessWidget {
  const ResponseContainer({
    super.key,
    required this.type,
    required this.content,
  });

  final int type;
  final String content;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatInputCubit, ChatInputState>(
      listener: (context, state) {},
      builder: (context, state) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 66, 233, 245),
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Color.fromARGB(255, 70, 219, 242), BlendMode.color),
          ),
          // border: Border.all(
          //   color: const Color.fromARGB(
          //       255, 113, 207, 244), // Set border color to pink
          //   width: 2.0, // Set border width (adjust as needed)
          // ),
          // borderRadius: const BorderRadius.all(
          //   Radius.circular(8.0), // Set the border radius to 8
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                // type == 0
                //     ? SvgPicture.asset('assets/linked.svg')
                //     : type == 1
                //         ? SvgPicture.asset('assets/twitter.svg')
                //         : SvgPicture.asset('assets/article.svg'),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  type == 0
                      ? "Here's Your Article!"
                      : type == 1
                          ? "Here's Your Enquiry!"
                          : "Here's Your Answer!",
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
      ),
    );
  }
}
