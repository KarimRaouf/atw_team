import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
<<<<<<< HEAD
import 'package:flutter_svg/flutter_svg.dart';
=======
>>>>>>> voice_document
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
<<<<<<< HEAD
    return BlocProvider(
      create: (context) => ChatInputCubit(),
      child: BlocConsumer<ChatInputCubit, ChatInputState>(
        listener: (context, state) {
          if (state is ResponseSuccessState) {
            print("Data fetched successfully: ${state.content}");

            Future.delayed(Duration.zero, () {
              final contentToPass =
                  ChatInputCubit.get(context).getSelectedContent();
              final index = ChatInputCubit.get(context).index;
              if (contentToPass != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ChatResponseScreen(
                      content: contentToPass,
                      type: index,
                    ),
                  ),
                );
              }
            });
          } else if (state is ResponseErrorState) {
            print("Error fetching data: ${state.errorMessage}");
          }
        },
        builder: (context, state) {
          ChatInputCubit cubit = ChatInputCubit();
          cubit = ChatInputCubit.get(context);
          var type = cubit.items;
          bool isSelected = false;

          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Image.asset(
                            'assets/atwlogo.png',
                            width: 150,
                            height: 100,
                          ),
                          const Positioned(
                            left: 80,
                            bottom: 10,
                            child: Text(
                              'TEAM',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      ChatTextField(cubit: cubit),
                      const SizedBox(height: 55),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          text: "Select a Type of Response",
                        ),
                      ),
                      const SizedBox(height: 20),
                      Stack(
                        children: [
                          SvgPicture.asset(
                            alignment: Alignment.centerRight,
                            'assets/mainFlow.svg',
                            color: const Color.fromARGB(255, 95, 205, 248),
                          ),
                          const Positioned(
                            bottom: 214,
                            left: 65,
                            child: Text('Select'),
                          ),
                          Positioned(
                            left: 25,
                            bottom: 42,
                            child: ArticleTypeContainer(
                                text: 'Enquiry',
                                index: 0,
                                onTap: () {
                                  cubit.selectType(0);
                                  isSelected = !isSelected;
                                },
                                isSelected: cubit.SelectedIndex == 0),
                          )
                        ],
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ArticleTypeContainer(
                              index: 1,
                              text: 'Article',
                              onTap: () {
                                cubit.selectType(1);
                                isSelected = !isSelected;
                                //cubit.selectType(index);
                              },
                              isSelected: cubit.SelectedIndex == 1,
                            ),
                            SizedBox(
                              width: 45,
                            ),
                            ArticleTypeContainer(
                              index: 2,
                              text: 'Question',
                              onTap: () {
                                cubit.selectType(2);
                                isSelected = !isSelected;
                                //cubit.selectType(index);
                              },
                              isSelected: cubit.SelectedIndex == 2,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            // Container(
                            //   width: 70,
                            //   height: 50,
                            //   decoration: ShapeDecoration(
                            //     shape: RoundedRectangleBorder(
                            //       side: const BorderSide(
                            //           width: 1,
                            //           color: Color.fromARGB(255, 95, 205, 248)),
                            //       borderRadius: BorderRadius.circular(11),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      // ListView.separated(
                      //   shrinkWrap: true,
                      //   physics: const NeverScrollableScrollPhysics(),
                      //   itemCount: cubit.items.length,
                      //   itemBuilder: (context, index) {
                      //     var type = cubit.items[index];
                      //     return ArticleTypeContainer(
                      //       iconPath: type['iconPath']!,
                      //       type: type['text']!,
                      //       onTap: () {
                      //         cubit.selectType(index);
                      //       },
                      //       isSelected: cubit.SelectedIndex == index,
                      //     );
                      //   },
                      //   separatorBuilder: (BuildContext context, int index) {
                      //     return const SizedBox(height: 32);
                      //   },
                      // ),
=======
    return BlocConsumer<ChatInputCubit, ChatInputState>(
      listener: (context, state) {
        if (state is ResponseSuccessState) {
          print("Data fetched successfully: ${state.content}");

          Future.delayed(Duration.zero, () {
            final contentToPass =
                ChatInputCubit.get(context).getSelectedContent();
            final type = ChatInputCubit.get(context).type;
            if (contentToPass != null) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => ChatResponseScreen(
                    content: contentToPass,
                    type: type,
                  ),
                ),
              );
            }
          });
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
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 60),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/atwlogo.png',
                        width: 150,
                        height: 100,
                      ),
                      const SizedBox(height: 32),
                      const Text("Enter Your Query"),
                      const SizedBox(height: 32),
                      ChatTextField(cubit: cubit),
                      const SizedBox(height: 40),
                      const Text("Choose Which Type of Response You Want"),
                      const SizedBox(height: 32),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
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
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 32);
                        },
                      ),
>>>>>>> voice_document
                      const SizedBox(height: 60),
                      GenerateButton(
                        isLoading: state is ResponseLoadingState,
                        onTap: () {
                          if (cubit.SelectedIndex != -1 &&
                              state is! ResponseLoadingState) {
<<<<<<< HEAD
                            cubit.fetchApiData(cubit.searchController.text);
=======
                            if (cubit.SelectedIndex == 0) {
                              cubit.fetchApiData(cubit.searchController.text);
                            } else if (cubit.SelectedIndex == 1) {
                              cubit.fetchHrDocumentQuestion(
                                  'Who is the most absences employee?');
                            } else {
                              cubit.requestChatGPT();
                            }
>>>>>>> voice_document
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Please select an article type first'),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
<<<<<<< HEAD
          );
        },
      ),
=======
          ),
        );
      },
>>>>>>> voice_document
    );
  }
}
