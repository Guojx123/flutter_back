import 'package:flutter/material.dart';

class TipWidget extends StatelessWidget {
  final String text;

  TipWidget(this.text);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black45,
        ),
      ),
    );
  }
}
