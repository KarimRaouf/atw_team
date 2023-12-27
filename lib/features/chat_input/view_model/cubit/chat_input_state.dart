abstract class ChatInputState {}

final class ChatInputInitial extends ChatInputState {}

final class TypeSelectedState extends ChatInputState {}

class ResponseLoadingState extends ChatInputState {}

class ResponseSuccessState extends ChatInputState {
  final Map<String, dynamic> responseData;
  ResponseSuccessState(this.responseData);
}

class ResponseErrorState extends ChatInputState {
  final String errorMessage;
  ResponseErrorState(this.errorMessage);
}
