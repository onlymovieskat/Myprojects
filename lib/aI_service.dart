
import 'dart:convert';

import 'package:http/http.dart' as http;

class AIService {
  static const String baseUrl = "https://api.aimlapi.com";
  static const String apiKey = "YOUR_API_KEY_HERE";

static Future<String> getResponse({
    required String model,
    required String systemPrompt,
    required String userMessage,
    double temperature = 1.0,
    int maxTokens = 1024,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': model,
          'messages': [
            {'role': 'system', 'content': systemPrompt},
            {'role': 'user', 'content': userMessage},
          ],
          'temperature': temperature,
          'max_tokens': maxTokens,
        }),
      );

      // Handle both 200 (OK) and 201 (Created) status codes
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return 'Error: ${response.statusCode} - ${response.body}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
