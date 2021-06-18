import 'package:flutter/material.dart';

class TimeSlider extends StatefulWidget {
  const TimeSlider({
    Key? key,
  }) : super(key: key);

  @override
  _TimeSliderState createState() => _TimeSliderState();
}

class _TimeSliderState extends State<TimeSlider> {
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade500,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text('00:00'),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: CustomTrackShape(),
              trackHeight: 1.0,
              thumbColor: Colors.redAccent,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
              overlayColor: Colors.red.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),

              ),
              child: Slider(
                value: _currentSliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text('05:00')),
        ],
      ),
    );
  }
}


class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
  required RenderBox parentBox,
  Offset offset = Offset.zero,
  required SliderThemeData sliderTheme,
  bool isEnabled = false,
  bool isDiscrete = false,
}) {
    assert(isEnabled != null);
    assert(isDiscrete != null);
    assert(parentBox != null);
    assert(sliderTheme != null);
    final double overlayWidth = sliderTheme.overlayShape!.getPreferredSize(isEnabled, isDiscrete).width;
    final double trackHeight = sliderTheme.trackHeight!;
    assert(overlayWidth >= 0);
    assert(trackHeight >= 0);

    final double trackLeft = offset.dx ;
    final double trackTop = offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;

    // If the parentBox'size less than slider's size the trackRight will be less than trackLeft, so switch them.
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}