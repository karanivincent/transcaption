import 'package:flutter/material.dart';
import 'package:transcaption/editor/section_two/typing/caption_group.dart';
import 'package:transcaption/models/Caption.dart';

class CaptionList extends StatelessWidget {
  final List<Caption> captions;
  Caption deleteCaption(int index) {
    return(captions.removeAt(index));
  }

  CaptionList({required this.captions, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return CaptionGroup(caption: captions[index]);
            },
            childCount: captions.length,
            semanticIndexOffset: 10,
          )),
        ],
      ),
    );
  }
}
