import "package:flutter/material.dart";
import 'package:transcaption/models/Caption.dart';

class CaptionGroup extends StatefulWidget {

  final Caption caption;
  CaptionGroup({required this.caption}): super(key: UniqueKey());
  @override
  _CaptionGroupState createState() => _CaptionGroupState();
}

class _CaptionGroupState extends State<CaptionGroup> {
  final myController = TextEditingController();

  bool focused = false;

  Color captionColor = Colors.orange;
  @override
  void initState() {
    myController.text = widget.caption.text;
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          setState(() {
            focused = focus;
          });
        },
        child: TextField(
          onChanged: (String text) {
            print(text);
            widget.caption.text = text;
            setState(() {
              if (text.length < 61) {
                captionColor = Colors.green;
                if (text.length < 40) {
                  captionColor = Colors.blue;
                  if (text.length < 20) {
                    captionColor = Colors.orange;
                  }
                }
              } else {
                captionColor = Colors.red;
              }
            });
          },
          controller: myController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          cursorColor: captionColor,
          cursorWidth: 3,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
            fillColor: Colors.white,
            filled: focused,
            enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.amber, width: 1.0),
                borderRadius: const BorderRadius.all(Radius.zero)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: captionColor,
                  width: 3.0,
                ),
                borderRadius: const BorderRadius.all(Radius.zero)),
          ),
        ),
      ),
    );
  }
}
