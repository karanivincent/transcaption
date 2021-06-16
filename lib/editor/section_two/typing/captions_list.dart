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
  void changeFocus(int index) {
    setState(() {
      focusedCaption = index;
      print('focus changed $focusedCaption');
    });
  }

  void captionRemove(int index) {
    widget.captionData.remove(index);
    changeFocus(index - 1);
  }

  void captionAdd(Caption caption) {
    setState(() {
      widget.captionData.add(caption);
    });
  }

  void captionInsert(int index, Caption caption) {
    widget.captionData.insert(index, caption);
    changeFocus(index);
  }

  @override
  Widget build(BuildContext context) {
    print('list focused caption: $focusedCaption');
    return Container(
      child: Column(
        children: [
          Flexible(
            child: ListView(
                children: widget.captionData.captions
                    .asMap()
                    .map((index, caption) => MapEntry(
                          index,
                          CaptionGroup(
                            caption: widget.captionData.captions[index],
                            key: widget.captionData.captions[index].key,
                            index: index,
                            focusedCaption: focusedCaption,
                            onAdd: captionAdd,
                            onInsert: captionInsert,
                            onRemove: captionRemove,
                            onChangeFocus: changeFocus,
                          ),
                        ))
                    .values
                    .toList()
                //   SliverList(
                //       delegate: SliverChildBuilderDelegate(
                //     (BuildContext context, int index) {
                //       return CaptionGroup(
                //         caption: widget.captionData.captions[index],
                //         key: widget.captionData.captions[index].key,
                //         index: index,
                //         focusedCaption: focusedCaption,
                //         onAdd: captionAdd,
                //         onInsert: captionInsert,
                //         onRemove: captionRemove,
                //         onChangeFocus: changeFocus,
                //       );
                //     },
                //     childCount: widget.captionData.captions.length,
                //     semanticIndexOffset: 3,
                //   )),
                // ],
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
