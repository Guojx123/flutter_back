import 'package:back/widgets/item_util.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleWidget('Table基本使用'),
        Container(
          color: Colors.blue,
          child: Table(
            border: TableBorder.all(),
            columnWidths: {1: FractionColumnWidth(.7)},
             // defaultColumnWidth: IntrinsicColumnWidth(),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                children: [
                  RandomHeightItem(),
                  RandomHeightItem(),
                ],
              ),
              TableRow(
                children: [
                  RandomHeightItem(),
                  RandomHeightItem(),
                ],
              ),
              TableRow(
                children: [
                  RandomHeightItem(),
                  RandomHeightItem(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
