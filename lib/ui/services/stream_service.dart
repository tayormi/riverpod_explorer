import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamServiceProvider = Provider<StreamService>((ref) {
  return StreamService();
});

class StreamService {
  Stream<int> getStream() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i).take(10);
  }
}
