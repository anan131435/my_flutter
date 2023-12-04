import 'dart:async';
import 'dart:developer';
import 'dart:io';
void main() {
  Timer.periodic(const Duration(seconds: 1), (timer) {
    runApp();
  });
  Directory watchDir = Directory(".");
  if (watchDir.existsSync()) {
    Stream<FileSystemEvent> stream = watchDir.watch(recursive: true);
    StreamSubscription subscription = stream.listen((event) {
      print(event);
    });
  }
}
void runApp() {
  print("Hello VVFlutter");
}