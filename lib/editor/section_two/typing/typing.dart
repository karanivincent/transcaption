import 'package:flutter/material.dart';
import 'package:transcaption/editor/section_two/typing/captions_list.dart';
import 'package:transcaption/models/captionModel.dart';

class TypingSection extends StatefulWidget {
  @override
  _TypingSectionState createState() => _TypingSectionState();
}

class _TypingSectionState extends State<TypingSection> {
  final CaptionDataList captions = CaptionDataList(captions: [
    Caption(text: '0', placeholder: 'Start typing here...', key: UniqueKey()),
    Caption(text: '1', placeholder: 'Start typing here...', key: UniqueKey()),
    Caption(text: '2', placeholder: 'Start typing here...', key: UniqueKey()),
    Caption(text: '3', placeholder: 'Start typing here...', key: UniqueKey()),
    Caption(text: '4', placeholder: 'Start typing here...', key: UniqueKey()),
    Caption(text: '5', placeholder: 'Start typing here...', key: UniqueKey()),
    Caption(text: '6', placeholder: 'Start typing here...', key: UniqueKey()),
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
          Flexible(child: CaptionList(captions)),
        ],
      ),
    );
}
