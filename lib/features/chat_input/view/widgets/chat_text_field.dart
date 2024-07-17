import 'package:flutter/material.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_cubit.dart';
<<<<<<< HEAD
=======
import 'package:mkag/shared/app_strings.dart';
import 'package:mkag/shared/services/open_ai_service.dart';
import 'package:mkag/shared/services/speech_to_text_service.dart';
import 'package:mkag/shared/services/text_to_speech_service.dart';
import 'package:speech_to_text/speech_to_text.dart';
>>>>>>> voice_document

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.cubit,
  });
  final ChatInputCubit cubit;
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
        controller: cubit.searchController,
        decoration: InputDecoration(
            suffixIcon: IconButton(
<<<<<<< HEAD
                onPressed: () {},
                color: const Color.fromARGB(255, 70, 219, 242),
                icon: const Icon(Icons.mic)),
=======
              onPressed: () async {
                await SpeechToTextService.startListening().then((_) {});
              },
              color: const Color.fromARGB(255, 95, 205, 248),
              icon: Icon(Icons.mic),
            ),
>>>>>>> voice_document
            border: InputBorder.none,
            hintText: 'Enter Query',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.30),
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
