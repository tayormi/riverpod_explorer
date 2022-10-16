import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_explorer/ui/services/stream_service.dart';

final streamValueProvider = StreamProvider.autoDispose((ref) {
  final streamService = ref.watch(streamServiceProvider);
  return streamService.getStream();
});

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(streamValueProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: const Text('Stream Provider'),
      ),
      body: Center(
        child: streamValue.when(data: (int data) {
          return Text(
            data.toString(),
            style: const TextStyle(fontSize: 30),
          );
        }, error: (Object error, StackTrace stackTrace) {
          return Text(error.toString());
        }, loading: () {
          return const CircularProgressIndicator();
        }),
      ),
    );
  }
}
