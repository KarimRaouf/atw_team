import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkag/features/chat_input/data/models/content.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_state.dart';
<<<<<<< HEAD
=======
import 'package:mkag/shared/app_strings.dart';
import 'package:mkag/shared/services/open_ai_service.dart';
import 'package:mkag/shared/services/speech_to_text_service.dart';
import 'package:mkag/shared/services/text_to_speech_service.dart';
>>>>>>> voice_document

class ChatInputCubit extends Cubit<ChatInputState> {
  ChatInputCubit() : super(ChatInputInitial());
  static ChatInputCubit get(context) => BlocProvider.of(context);
  int SelectedIndex = -1;
  final List<Map<String, String>> items = [
    {'iconPath': '', 'text': 'Article'},
<<<<<<< HEAD
    {'iconPath': '', 'text': 'Enquiry'},
=======
    {'iconPath': '', 'text': 'Enquire'},
>>>>>>> voice_document
    {'iconPath': '', 'text': 'Question'},
  ];
  final TextEditingController searchController = TextEditingController();

<<<<<<< HEAD
  int index = -1;
=======
  int type = -1;
>>>>>>> voice_document

  void selectType(int index) {
    SelectedIndex = index;
    emit(TypeSelectedState());
  }

  final Dio dio = Dio();

  Future<void> fetchApiData(String keyword) async {
    emit(ResponseLoadingState());
    try {
      final response = await dio.get('http://164.92.125.73:8000/mkag/search',
          data: {"prompt": keyword});

      if (response.data != null && response.data is Map<String, dynamic>) {
        final apiResponse = Content.fromJson(response.data);
        print(response.data);
        emit(ResponseSuccessState(apiResponse));
      } else {
        emit(ResponseErrorState("Invalid data format"));
      }
    } catch (e) {
      emit(ResponseErrorState(e.toString()));
    }
  }

<<<<<<< HEAD
=======
  Future<void> fetchHrDocumentQuestion(String question) async {
    emit(ResponseLoadingState());
    try {
      final response = await dio.post(
        'http://164.92.125.73:8000/documentretrieving/resultv1/hr',
        data: {"question": question},

      );

      if (response.data != null && response.data is Map<String, dynamic>) {
        //final apiResponse = Content.fromJson(response.data);
        print(response.data);
        emit(ResponseSuccessState(response.data['Answer']));
      } else {
        emit(ResponseErrorState("Invalid data format"));
      }
    } catch (e) {
      emit(ResponseErrorState(e.toString()));
    }
  }

>>>>>>> voice_document
  String? getSelectedContent() {
    if (state is ResponseSuccessState) {
      ResponseSuccessState currentState = state as ResponseSuccessState;
      switch (SelectedIndex) {
        case 0:
<<<<<<< HEAD
          index = 0;
          return currentState.content.linkedInContent;
        case 1:
          index = 2;
          return currentState.content.twitterContent;
        case 2:
          index = 1;
          return currentState.content.articleContent;
=======
          type = 0;
          return currentState.content.linkedInContent;
        case 1:
          type = 1;
          return currentState.content.articleContent;
        case 2:
          type = 2;
          return response;
>>>>>>> voice_document
        default:
          return null;
      }
    }
    return null;
  }
<<<<<<< HEAD
=======

  void requestChatGPT() {
    emit(ResponseLoadingState());

    OpenAISercive.isArtPromptAPI(SpeechToTextService.recognizedWords)
        .then((_) {


        });
  }
>>>>>>> voice_document
}
