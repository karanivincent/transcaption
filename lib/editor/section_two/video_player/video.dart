import 'package:flutter/material.dart';
import 'package:transcaption/editor/section_two/video_player/controls.dart';
import 'package:transcaption/editor/section_two/video_player/time_slider.dart';
import 'package:transcaption/editor/section_two/video_player/video_display.dart';


class VideoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          TimeSlider(),
          Flexible(
            child: Row(
              children: [
                Container(
                  child: VideoControls(),
                  color: Colors.green,
                  width: 40,
                  transform: Matrix4.translationValues(-40, 0, 0),
                  ),
                Expanded(
                  child: Container(
                    color: Colors.grey.shade800,
                    child: VideoDisplay())
                  ),
              ],
            ),
          )

        ],
      )

    );
  }
}



