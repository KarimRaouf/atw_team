import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkag/features/chat_input/view/widgets/article_type_container.dart';
import 'package:mkag/features/chat_input/view/widgets/chat_text_field.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_cubit.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_state.dart';
import 'package:mkag/features/chat_response/view/chat_response_screen.dart';

import 'widgets/generate_button.dart';

class ChatInputScreen extends StatelessWidget {
  const ChatInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatInputCubit(),
      child: BlocConsumer<ChatInputCubit, ChatInputState>(
        listener: (context, state) {
          if (state is ResponseSuccessState) {
            print("Data fetched successfully: ${state.responseData}");
          } else if (state is ResponseErrorState) {
            print("Error fetching data: ${state.errorMessage}");
          }
        },
        builder: (context, state) {
          var cubit = ChatInputCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16, right: 16, bottom: 60),
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
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: cubit.items.length,
                            itemBuilder: (context, index) {
                              var type = cubit.items[index];
                              return ArticleTypeContainer(
                                iconPath: type['iconPath']!,
                                type: type['text']!,
                                onTap: () {
                                  cubit.selectType(index);
                                },
                                isSelected: cubit.SelectedIndex == index,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 32,
                              );
                            },
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
                            onTap: () {
                              cubit.fetchApiData();

                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //       builder: (BuildContext context) =>
                              //           const ChatResponseScreen()),
                              // );
                            },
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
