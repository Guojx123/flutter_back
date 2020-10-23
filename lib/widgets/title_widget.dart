import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final title;

  TitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 2, color: getGoogleBlue()),
          bottom: BorderSide(width: 2, color: getGoogleBlue()),
          left: BorderSide(width: 8, color: getGoogleBlue()),
          right: BorderSide(width: 2, color: getGoogleBlue()),
        ),
      ),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Text(
          " $title",
          style: TextStyle(
            color: getGoogleBlue(),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

getGoogleBlue() => Colors.teal.withOpacity(0.8);
