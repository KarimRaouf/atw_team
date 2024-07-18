import 'package:mkag/features/chat_input/data/models/content.dart';

abstract class ChatInputState {}

final class ChatInputInitial extends ChatInputState {}

final class TypeSelectedState extends ChatInputState {}

class ResponseLoadingState extends ChatInputState {}

class ResponseSuccessState extends ChatInputState {
   final String content;
  ResponseSuccessState(this.content);
}

class ResponseErrorState extends ChatInputState {
  final String errorMessage;
  ResponseErrorState(this.errorMessage);
}

class ChangeTextColorState extends ChatInputState{}
