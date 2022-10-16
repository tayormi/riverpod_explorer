import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explorer/ui/models/suggestion.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Suggestion> getSuggestion(String id) async {
    try {
      final res = await Dio().get('https://www.boredapi.com/api/activity');
      return Suggestion.fromJson(res.data);
    } catch (e) {
      throw Exception('Error getting suggestion');
    }
  }
}
