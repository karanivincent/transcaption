import 'package:flutter/material.dart';
import 'package:transcaption/editor/section_two/section_two.dart';

class Sections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(flex:3, child: Container(color: Colors.red, child: Text('Part 1'))),
          Expanded(
            flex:6,
            child: SectionTwo(),
          ),
          Expanded(flex: 3, child: Container( color: Colors.green, child: Text('part 3'))),
        ],

      ),
    );
  }
}