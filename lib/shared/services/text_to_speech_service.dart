import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';

abstract class TextToSpeechService {
  static final FlutterTts _flutterTts = FlutterTts();
  static bool _isSpeaking = false;

  static Future<void> initTTS() async {
    try {
      _flutterTts.setStartHandler(() {
        _isSpeaking = true;
        print("TTS started speaking");
      });

      _flutterTts.setCompletionHandler(() {
        _isSpeaking = false;
        print("TTS completed speaking");
      });

      _flutterTts.setErrorHandler((msg) {
        _isSpeaking = false;
        print("TTS error: $msg");
      });
      if (Platform.isIOS) {
        await _flutterTts.setSharedInstance(true);

        _setAwaitOptions();

        // List<dynamic> voices = await _flutterTts.getVoices;

        await _flutterTts
            .setLanguage("en-US"); // Setting the language to Arabic

        //   await _flutterTts.setVoice({"name": "Majed", "locale": "ar-001"});

        await _flutterTts.setIosAudioCategory(
            IosTextToSpeechAudioCategory.ambient,
            [
              IosTextToSpeechAudioCategoryOptions.allowBluetooth,
              IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
              IosTextToSpeechAudioCategoryOptions.mixWithOthers
            ],
            IosTextToSpeechAudioMode.voicePrompt);

        await _flutterTts.setSpeechRate(0.58);

        await _flutterTts.awaitSpeakCompletion(true);
        await _flutterTts.awaitSynthCompletion(true);
        // await flutterTts.setQueueMode(1);
      } else {
        _setAwaitOptions();
        await _flutterTts
            .setLanguage("en-US"); // Setting the language to Arabic

        List<dynamic> voices = await _flutterTts.getVoices;
        print(voices);

        var engines = await _flutterTts.getEngines;

        await _flutterTts.setEngine("com.google.android.tts");
        //   await _flutterTts.setVoice(
        //     {"name": "en-us-x-sfg#female_1-local", "locale": "en-US"});
      }
    } catch (e) {
      print("Error during TTS initialization: $e");
    }
  }

  static Future<void> _setAwaitOptions() async {
    await _flutterTts.awaitSpeakCompletion(true);
  }

  static Future<void> speak({required String text}) async {
    await _flutterTts.speak(text);
  }

  static Future<void> stop() async {
    await _flutterTts.stop();
  }

  static bool isSpeaking() {
    return _isSpeaking;
  }

  static void clearVoice() {
    _flutterTts.clearVoice();
  }
}
