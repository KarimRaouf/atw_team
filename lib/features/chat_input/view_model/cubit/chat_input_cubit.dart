
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkag/features/chat_input/view_model/cubit/chat_input_state.dart';

class ChatInputCubit extends Cubit<ChatInputState> {
  ChatInputCubit() : super(ChatInputInitial());
  static ChatInputCubit get(context) => BlocProvider.of(context);
   int SelectedIndex = -1;
  final List<Map<String, String>> items = [
    {'iconPath': 'assets/linked.svg', 'text': 'Linked In'},
    {'iconPath': 'assets/twitter.svg', 'text': 'Twitter'},
    {'iconPath': 'assets/article.svg', 'text': 'MKAG Article'},
  ];

  void selectType(int index) {
    SelectedIndex = index;
    emit(TypeSelectedState());
  }
   final Dio dio = Dio(); // Create Dio instance

  Future<void> fetchApiData() async {
    emit(ResponseLoadingState());
    try {
      final response = await dio.get(
        'http://164.92.125.73:8000/mkag/search',
        data: {"prompt": "Flutter"}
      );
      emit(ResponseSuccessState(response.data));
    } catch (e) {
      emit(ResponseErrorState(e.toString()));
    }
  }
}