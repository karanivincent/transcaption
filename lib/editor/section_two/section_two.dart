import 'package:flutter/material.dart';
import 'package:transcaption/editor/section_two/typing/typing.dart';
import 'package:transcaption/editor/section_two/video.dart';

class SectionTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Column(

        children:[
          TypingSection(),
          VideoSection(),
          ],


      ),
    );
  }
}