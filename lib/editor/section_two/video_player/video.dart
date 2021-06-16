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
          Row(
            children: [
              VideoControls(),
              VideoDisplay(),
            ],
          )

        ],
      )

    );
  }
}



