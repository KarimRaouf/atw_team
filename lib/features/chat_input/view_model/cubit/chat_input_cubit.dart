import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkag/features/chat_input/data/models/content.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_state.dart';

class ChatInputCubit extends Cubit<ChatInputState> {
  ChatInputCubit() : super(ChatInputInitial());
  static ChatInputCubit get(context) => BlocProvider.of(context);
  int SelectedIndex = -1;
  final List<Map<String, String>> items = [
    {'iconPath': '', 'text': 'Article'},
    {'iconPath': '', 'text': 'Enquiry'},
    {'iconPath': '', 'text': 'Question'},
  ];
  final TextEditingController searchController = TextEditingController();

  int index = -1;

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

  String? getSelectedContent() {
    if (state is ResponseSuccessState) {
      ResponseSuccessState currentState = state as ResponseSuccessState;
      switch (SelectedIndex) {
        case 0:
          index = 0;
          return currentState.content.linkedInContent;
        case 1:
          index = 2;
          return currentState.content.twitterContent;
        case 2:
          index = 1;
          return currentState.content.articleContent;
        default:
          return null;
      }
    }
    return null;
  }
}
