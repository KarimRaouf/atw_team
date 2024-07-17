import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mkag/shared/app_strings.dart';
import 'package:mkag/shared/services/text_to_speech_service.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextService {
  static final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  static String recognizedWords = '';
  static bool isFinalResult = false;

  static void initSpeech() async {
    bool _speechEnabled = await _speechToText.initialize();
  }

  static Future<void> startListening() async {
    await _speechToText.listen(
      pauseFor: const Duration(seconds: 3),
      listenFor: const Duration(minutes: 2),
      onResult: _onSpeechResult,
    );
  }

  static void _onSpeechResult(SpeechRecognitionResult result) {
    print(isFinalResult);
    print('isFinalResult');
    isFinalResult = false;
    recognizedWords = result.recognizedWords;

    isFinalResultWords(result: result);

    if (isFinalResult) {
      TextToSpeechService.speak(text: AppStrings.selectOptions);
    }
  }

  static void isFinalResultWords({required SpeechRecognitionResult result}) {
    if (result.finalResult) {
      print(result.finalResult);
      print(recognizedWords);

      print('object');
      isFinalResult = true;
    } else {
      isFinalResult = false;
    }
  }

  static Future<void> stopListening() async {
    await _speechToText.stop();
  }
}
