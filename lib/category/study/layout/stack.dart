import 'package:flutter/material.dart';

class StackPage extends StatefulWidget {
  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {

  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: _alignmentDirectional,
          children: <Widget>[
            Container(width: 300.0, height: 300.0, color: Colors.red),
            Container(width: 200.0, height: 200.0, color: Colors.green),
            Container(width: 100.0, height: 100.0, color: Colors.blue),
          ],
        ),
      ),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  Widget _getBottomBar() {
    const kAlignmentDirectionalVals = <String, AlignmentDirectional>{
      'topStart': AlignmentDirectional.topStart,
      'topCenter': AlignmentDirectional.topCenter,
      'topEnd': AlignmentDirectional.topEnd,
      'centerStart': AlignmentDirectional.centerStart,
      'center': AlignmentDirectional.center,
      'centerEnd': AlignmentDirectional.centerEnd,
      'bottomStart': AlignmentDirectional.bottomStart,
      'bottomCenter': AlignmentDirectional.bottomCenter,
      'bottomEnd': AlignmentDirectional.bottomEnd
    };
    return Material(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('alignmentDirectional:'),
            trailing: DropdownButton<AlignmentDirectional>(
              value: _alignmentDirectional,
              onChanged: (AlignmentDirectional newVal) {
                if (newVal != null) {
                  setState(() => this._alignmentDirectional = newVal);
                }
              },
              items: kAlignmentDirectionalVals
                  .map(
                    (String name, AlignmentDirectional val) => MapEntry(
                  name,
                  DropdownMenuItem(value: val, child: Text(name)),
                ),
              )
                  .values
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
