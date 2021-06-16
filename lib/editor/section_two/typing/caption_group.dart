import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/editable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:transcaption/models/captionModel.dart';
import 'dart:math';


class CaptionGroup extends StatefulWidget {
  final Caption caption;
  final int index;
  final int focusedCaption;
  final Function onAdd;
  final Function onRemove;
  final Function onInsert;
  final Function onChangeFocus;
  CaptionGroup(
      {required this.caption,
      required this.index,
      required this.focusedCaption,
      required this.onAdd,
      required this.onRemove,
      required this.onInsert,
      required this.onChangeFocus,
      Key? key})
      : super(key: key);
  @override
  _CaptionGroupState createState() => _CaptionGroupState();
}

class _CaptionGroupState extends State<CaptionGroup> {
  final myController = TextEditingController();
  late FocusNode _node;
  late FocusAttachment _nodeAttachment;
  bool _focused = false;
  Color _color = Colors.white;

  Color captionColor = Colors.orange;
  @override
  void initState() {
    myController.text = widget.caption.text;
    super.initState();
    _node = FocusNode(debugLabel: 'caption ${widget.index}');
    _node.addListener(_handleFocusChange);
    _nodeAttachment = _node.attach(
      context,
      onKey: _handleKeyPress,
    );
  }

  void _handleFocusChange() {
    if (_node.hasFocus != _focused) {
      setState(() {
        _focused = _node.hasFocus;
        if (_focused) widget.onChangeFocus(widget.index);

        print("focused node ${widget.index} $_focused");
      });
    }
  }

  KeyEventResult _handleKeyPress(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.logicalKey == LogicalKeyboardKey.enter) {
        var selectionStart = myController.selection.start;
        var stringText = myController.text;
        var stringLength = stringText.length;
        var preText = stringText.substring(0, selectionStart);
        var postText = stringText.substring(selectionStart, stringLength);
        if (postText.length>0) myController.text = preText;
        Caption newCaption = Caption(text: postText, key: UniqueKey());
        widget.onInsert(widget.index + 1, newCaption);
        return KeyEventResult.handled;
      } else if (event.logicalKey == LogicalKeyboardKey.backspace) {
        var selection = myController.selection;
        if (selection.start == 0 && selection.start == selection.end) {
          widget.onRemove(widget.index);
          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        var selection = myController.selection;
        if (selection.start == 0 && selection.start == selection.end) {
          widget.onChangeFocus(widget.index - 1);
          return KeyEventResult.handled;
        }
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        var selection = myController.selection;
        if (selection.start == myController.text.length &&
            selection.start == selection.end) {
          widget.onChangeFocus(widget.index + 1);
          return KeyEventResult.handled;
        }
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    _node.removeListener(_handleFocusChange);
    // The attachment will automatically be detached in dispose().
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.index == widget.focusedCaption) _node.requestFocus();

    return TextField(
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
      focusNode: _node,
      // selectionControls: SelectionControl(),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 6, vertical: 16),
        fillColor: Colors.white,
        filled: _focused,
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
    );
  }
}
