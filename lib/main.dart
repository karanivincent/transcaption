import 'package:flutter/material.dart';
import 'package:transcaption/video_setup.dart';
import './main.dart';

// if (dart.library.html) 'dart:ui' as ui;
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String _videoSrc;
  final String _localVideoPlayerId = 'local-video-player';
  // TODO: VideoSetup class to be defined later
  final VideoSetup _videoSetup = VideoSetup();
  // TODO: to be completed later
  Future<void> _registerNativeVideoPlayer() async {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: (_videoSrc == null)
              ? TextButton(
                  onPressed: () => _registerNativeVideoPlayer(),
                  child: Text('Upload Video'),
                )
              : SizedBox(
                  width: 200,
                  height: 200,
                  // This won't work for now
                  child: HtmlElementView(viewType: _localVideoPlayerId),
                ),
        ),
      ),
    );
  }
}

/// dummy class to resolve dart:ui and analyzer issues
class PlatformViewRegistry {
  static registerViewFactory(String viewId, dynamic cb) {}
}
