import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mkag/features/chat_input/view/widgets/article_type_container.dart';
import 'package:mkag/features/chat_input/view/widgets/chat_text_field.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_cubit.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_state.dart';
import 'package:mkag/features/chat_response/view/chat_response_screen.dart';
import 'package:mkag/shared/app_strings.dart';
import 'package:mkag/shared/services/open_ai_service.dart';
import 'package:mkag/shared/services/speech_to_text_service.dart';
import 'package:mkag/shared/services/text_to_speech_service.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'widgets/generate_button.dart';

class ChatInputScreen extends StatelessWidget {
  const ChatInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatInputCubit, ChatInputState>(
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
        bool isSelected = false;

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
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
                      text: TextSpan(
                        style: TextStyle(
                          color: cubit.textColor,
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
                          const SizedBox(
                            width: 30,
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    GenerateButton(
                      isLoading: state is ResponseLoadingState,
                      onTap: () {
                        if (cubit.SelectedIndex != -1 &&
                            state is! ResponseLoadingState &&
                            (cubit.searchController.text.isNotEmpty ||
                                SpeechToTextService.recognizedWords != '')) {
                          String enterText = '';
                          if (cubit.searchController.text.isNotEmpty) {
                            enterText = cubit.searchController.text;
                          } else {
                            enterText = SpeechToTextService.recognizedWords;
                          }

                          if (cubit.SelectedIndex == 0) {
                            cubit.fetchHrDocumentQuestion(enterText);
                          } else if (cubit.SelectedIndex == 1) {
                            cubit.fetchApiData(enterText);
                          } else {
                            cubit.requestChatGPT(enterText);
                          }
                        } else {
                          if (cubit.SelectedIndex == -1) {
                            TextToSpeechService.speak(
                                text: AppStrings.selectOptions);
                          } else {
                            TextToSpeechService.speak(
                              text: AppStrings.writeOrVoice,
                            );
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}