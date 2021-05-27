import 'package:flutter_riverpod/flutter_riverpod.dart';

class Caption {
  String text, placeholder;

  Caption({this.text = '', this.placeholder = ''});
}

class CaptionDataList {
  final List<Caption> captions;

  CaptionDataList({required this.captions});

  void add(Caption caption) {
    captions.add(caption);
  }

  Caption remove(int captionIndex) {
    var deleted = captions.removeAt(captionIndex);
    print('datalistfunction');
    for (int i = 0; i < captions.length; i++) {
      print(captions[i].text);
    }
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
