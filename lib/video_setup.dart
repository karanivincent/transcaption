import 'dart:async';
import 'package:universal_html/html.dart' as html;
class VideoSetup{

  static VideoSetup _videoSetup;
  VideoSetup._internal();
  factory VideoSetup(){
    if(_videoSetup == null) _videoSetup = VideoSetup._internal();
    return _videoSetup;
  }
  /// to upload a video from the system
  /// and create a url from it
  Future<String> getLocalVideoUrl() async{
    final completer = Completer<String>();
    // create input element to upload video file from the system
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.accept = 'video/*';
    uploadInput.click();
    uploadInput.onChange.listen((e){
      final files = uploadInput.files;
      if(files.length > 0){
        final file = files[0];
        String url = html.Url.createObjectUrl(file);
        completer.complete(url);
      }
    });
    return completer.future;
  }
  /// to create a video element with provided src
  html.VideoElement createVideoElement(String src){
    return html.VideoElement()
    ..controls = true
    ..autoplay = true
    ..src = src;
  }
}