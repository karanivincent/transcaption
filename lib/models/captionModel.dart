import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Caption {
  String text, placeholder;
  Key key;

  Caption({this.text = '', this.placeholder = '', required this.key});
}

class CaptionDataList {
  final List<Caption> captions;

  CaptionDataList({required this.captions});

  void add(Caption caption) {
    captions.add(caption);
  }

  void insert(int index, Caption caption) {
    captions.insert(index, caption);
  }

  Caption remove(int captionIndex) {
    print(captionIndex);
    var deleted = captions.removeAt(captionIndex);
    print(deleted.text);
    return deleted;
  }
}

class CaptionsNotifier extends StateNotifier<List<Caption>> {
  CaptionsNotifier() : super([]);

  void add(Caption caption) {
    state.add(caption);
  }

  void remove(int captionId) {
    state.removeAt(captionId);
  }
}
