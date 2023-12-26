
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
}
