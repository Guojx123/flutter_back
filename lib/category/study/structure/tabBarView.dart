
import 'package:flutter/material.dart';

class TabBarViewPage extends StatefulWidget {
  @override
  _TabBarViewPageState createState() => _TabBarViewPageState();
}

class _TabBarViewPageState extends State<TabBarViewPage> {

  List tabLabels = ['Tab1', 'Tab2', 'Tab3', 'Tab4'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text('TabPageSelectorWidget'),
            ),
            body: DefaultTabController(
              length: tabLabels.length,
              child: Builder(builder: (context) {
                return Column(
                  children: <Widget>[
                    TabPageSelector(),
                    Expanded(
                      child: TabBarView(
                          children: tabLabels.map((value) {
                            return Text(value);
                          }).toList()),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
