import 'package:flutter/material.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_cubit.dart';

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
                onPressed: () {},
                color: const Color.fromARGB(255, 70, 219, 242),
                icon: const Icon(Icons.mic)),
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
