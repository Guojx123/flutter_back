import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  @override
  _SliverAppBarPageState createState() => _SliverAppBarPageState();
}

class _SliverAppBarPageState extends State<SliverAppBarPage> {
  var pinned = false;
  var snap = false;
  var floating = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleWidget('SliverAppBar基本使用'),
        SubtitleWidget('SliverAppBar限制Title高度最小56'),
        Row(
          children: <Widget>[
            Text('Pinned'),
            Switch(
              value: pinned,
              onChanged: (value) {
                setState(() => pinned = value);
              },
            ),
            Text('Snap'),
            Switch(
              value: snap,
              onChanged: (value) {
                setState(() {
                  if (value) {
                    floating = true;
                  }
                  snap = value;
                });
              },
            ),
            Text('Floating'),
            Switch(
              value: floating,
              onChanged: (value) {
                setState(() => floating = value);
              },
            ),
          ],
        ),
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'images/owl.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text('SliverAppBar'),
                snap: snap,
                pinned: pinned,
                floating: floating,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 50,
                      color: Colors.grey.shade200,
                    );
                  },
                  childCount: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
