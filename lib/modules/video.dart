import 'package:flutter/cupertino.dart';

class Video with ChangeNotifier {
  final String url;
  final String nameVideo;
  final Duration duration;
  bool seen;

  Video(
      {required this.url,
      required this.nameVideo,
      required this.duration,
      this.seen = false});

  void checkVideo() {
    seen = true;
    //  notifyListeners();
  }
}
