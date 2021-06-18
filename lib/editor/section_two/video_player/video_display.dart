
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDisplay extends StatefulWidget {
  const VideoDisplay({
    Key? key,
  }) : super(key: key);

  @override
  _VideoDisplayState createState() => _VideoDisplayState();
}

class _VideoDisplayState extends State<VideoDisplay> {
  late VideoPlayerController _videoController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.network(
        // 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4'
        'https://vod-progressive.akamaized.net/exp=1623930545~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2495%2F19%2F487478294%2F2185326107.mp4~hmac=3fe643d70b6ee60e85d5cd1270da18755b8fd6bfa0a4e23224019370e282793c/vimeo-prod-skyfire-std-us/01/2495/19/487478294/2185326107.mp4?filename=pexels-keira-burton-6082598.mp4'

        )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 400),
          child: AspectRatio(
            aspectRatio: _videoController.value.aspectRatio,
            child: VideoPlayer(_videoController)),
        ),
        IconButton(
          onPressed: (){
            setState(() {
              _videoController.value.isPlaying
                  ? _videoController.pause()
                  : _videoController.play();
            });
          },
           icon: Icon(_videoController.value.isPlaying ? Icons.pause : Icons.play_arrow),
    )
      ],
    );
  }
}
