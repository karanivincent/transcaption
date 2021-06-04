import 'package:flutter/material.dart';
import 'package:transcaption/editor/section_two/typing/caption_group.dart';
import 'package:transcaption/models/captionModel.dart';

class CaptionList extends StatefulWidget {
  final CaptionDataList captionData;

  CaptionList(this.captionData);

  @override
  _CaptionListState createState() => _CaptionListState();
}

class _CaptionListState extends State<CaptionList> {
  int focusedCaption = -1;
  void captionRemove(int index) {
    setState(() {
      focusedCaption = index - 1;
      widget.captionData.remove(index);

    });
  }

  void captionAdd(Caption caption) {
    setState(() {
      widget.captionData.add(caption);
    });
  }

  void captionInsert(int index, Caption caption) {
    setState(() {
      focusedCaption = index;
      widget.captionData.insert(index, caption);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return CaptionGroup(
                      caption: widget.captionData.captions[index],
                      key: widget.captionData.captions[index].key,
                      index: index,
                      focusedCaption: focusedCaption,
                      onAdd: captionAdd,
                      onInsert: captionInsert,
                      onRemove: captionRemove,
                    );
                  },
                  childCount: widget.captionData.captions.length,
                  semanticIndexOffset: 3,
                )),
              ],
            ),
          ),
          Container(
            child: TextButton(
              child: Text(widget.captionData.captions[1].text),
              onPressed: () {
                setState(() {
                  widget.captionData.remove(1);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
