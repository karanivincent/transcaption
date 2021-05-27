import 'package:flutter/material.dart';
import 'package:transcaption/editor/section_two/typing/caption_group.dart';
import 'package:transcaption/models/Caption.dart';

class CaptionList extends StatefulWidget {

  CaptionList({ Key? key}) : super(key: key);

  @override
  _CaptionListState createState() => _CaptionListState();
}

class _CaptionListState extends State<CaptionList> {
  final CaptionDataList captions = CaptionDataList(captions: [
    Caption(text: '0', placeholder: 'Start typing here...'),
    Caption(text: '1', placeholder: 'Start typing here...'),
    Caption(text: '2', placeholder: 'Start typing here...'),
    Caption(text: '3', placeholder: 'Start typing here...'),
    Caption(text: '4', placeholder: 'Start typing here...'),
    Caption(text: '5', placeholder: 'Start typing here...'),
    Caption(text: '6', placeholder: 'Start typing here...'),
    Caption(text: '7', placeholder: 'Start typing here...'),
  ]);

  @override
  Widget build(BuildContext context) {
    print('captionlist section');
    for (int i = 0; i < captions.captions.length; i++) {
      print(captions.captions[i].text);
    }
    return Container(
      child: Column(
        children: [
          Flexible(
              child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return CaptionGroup(caption: captions.captions[index]);
                  },
                  childCount: captions.captions.length,
                  semanticIndexOffset: 3,

                )

                ),
              ],
            ),
          ),
          Container(
            child: TextButton(
              child: Text(captions.captions[1].text),
              onPressed: () {
                setState(() {
                  captions.remove(1);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
