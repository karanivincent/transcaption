import 'package:flutter/material.dart';
import 'package:transcaption/editor/section_two/typing/custom_scroll.dart';
import 'package:transcaption/models/Caption.dart';

class TypingSection extends StatefulWidget {
  @override
  _TypingSectionState createState() => _TypingSectionState();
}

class _TypingSectionState extends State<TypingSection> {
  CaptionDataList captions = CaptionDataList(captions: [
    Caption(text: '0', placeholder: 'Start typing here...'),
    Caption(text: '1', placeholder: 'Start typing here...'),
    Caption(text: '2', placeholder: 'Start typing here...'),
    Caption(text: '3', placeholder: 'Start typing here...'),
    Caption(text: '4', placeholder: 'Start typing here...'),
    Caption(text: '5', placeholder: 'Start typing here...'),
    Caption(text: '6', placeholder: 'Start typing here...'),
  ]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Flexible(
      child: Column(
        children: [
          Flexible(child: CaptionList()),
        ],
      ),
    );
}
