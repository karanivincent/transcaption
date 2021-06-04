import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/editable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transcaption/models/captionModel.dart';


class SelectionControl extends TextSelectionControls{

  @override
  Future<void> handlePaste(TextSelectionDelegate delegate) {
    // TODO: implement handlePaste
    return super.handlePaste(delegate);
  }

  @override
  Widget buildHandle(BuildContext context, TextSelectionHandleType type, double textLineHeight) {
      // TODO: implement buildHandle
      throw UnimplementedError();
    }

    @override
    Widget buildToolbar(BuildContext context, Rect globalEditableRegion, double textLineHeight, Offset position, List<TextSelectionPoint> endpoints, TextSelectionDelegate delegate, ClipboardStatusNotifier clipboardStatus, Offset? lastSecondaryTapDownPosition) {
      // TODO: implement buildToolbar
      throw UnimplementedError();
    }

    @override
    Offset getHandleAnchor(TextSelectionHandleType type, double textLineHeight) {
      // TODO: implement getHandleAnchor
      throw UnimplementedError();
    }

    @override
    Size getHandleSize(double textLineHeight) {
    // TODO: implement getHandleSize
    throw UnimplementedError();
  }

}
class CaptionGroup extends StatefulWidget {
  final Caption caption;
  final int index;
  final int focusedCaption;
  final Function onAdd;
  final Function onRemove;
  final Function onInsert;
  CaptionGroup(
      {required this.caption,
      required this.index,
      required this.focusedCaption,
      required this.onAdd,
      required this.onRemove,
      required this.onInsert,
      Key? key})
      : super(key: key);
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
        onKey: (node, event) {
          // var keypressed = event.character;
          // print(keypressed);
          // print(KeyEventResult.handled);

          if (event.character == 'Enter') {
            var stringText = myController.text;
            var selectionStart = myController.selection.start;
            var stringLength = stringText.length;
            var preText = stringText.substring(0, selectionStart);
            var postText = stringText.substring(selectionStart, stringLength);
            myController.text = preText;
            print(postText);

            Caption newCaption = Caption(text: postText, key: UniqueKey());

            widget.onInsert(widget.index + 1, newCaption);
            return KeyEventResult.handled;
          } else if (event.character == 'Backspace') {
            var selection = myController.selection;
            if (selection.start == 0 && selection.start == selection.end) {
              widget.onRemove(widget.index);
              return KeyEventResult.handled;
            }
            print('Start: ${selection.start}');
            print('End: ${selection.end}');
            print('Extent: ${selection.extent}');
            return KeyEventResult.ignored;
          }
          return KeyEventResult.ignored;
        },
        child: TextField(
          onChanged: (String text) {
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
          autofocus: widget.index == widget.focusedCaption,
          controller: myController,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          cursorColor: captionColor,
          cursorWidth: 3,
          
          selectionControls: SelectionControl(),
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
