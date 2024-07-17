import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mkag/shared/app_strings.dart';



class OpenAISercive {
  static Future<String> isArtPromptAPI(String prompt) async {
    try {
      response = '';
      var res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AppStrings.chatGPT}',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'user',
              'content': '$prompt',
            },
          ],
        }),
      );

      print(res.body);
      if (res.statusCode == 200) {
        response = jsonDecode(res.body)['choices'][0]['message']['content'];
        print('yeh');
      }
    } catch (error) {
      print(error.toString());
    }

    return "AI";
  }

  Future<String> chatGPTAPI(String prompt) async {
    return 'Chat';
  }

  Future<String> dallEAPI(String prompt) async {
    return 'Dall';
  }
}
