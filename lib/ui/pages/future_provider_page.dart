import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explorer/ui/models/suggestion.dart';
import 'package:riverpod_explorer/ui/services/api_service.dart';

final suggestionFutureProvider =
    FutureProvider.autoDispose.family<Suggestion, String>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion(id);
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider('1'));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Future Provider'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(suggestionFutureProvider('1').future),
        child: ListView(
          children: [
            suggestionRef.when(data: (data) {
              return Text(
                data.activity,
                style: Theme.of(context).textTheme.headline4,
              );
            }, error: (error, _) {
              return Text(error.toString());
            }, loading: () {
              return const CircularProgressIndicator();
            }),
          ],
        ),
      ),
    );
  }
}
