import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ScaffoldPage extends StatefulWidget {
  @override
  _ScaffoldPageState createState() => _ScaffoldPageState();
}

class _ScaffoldPageState extends State<ScaffoldPage> {

  bool _isBottomBarNotched = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleWidget('Scaffold基本使用'),
        SubtitleWidget("基本用法"),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Text('Scaffold'),
            ),
            body: Center(
              child: Text('Scaffold'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
            backgroundColor: Colors.orange,
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text('Guojunxian'),
                    accountEmail: Text('hdb41348@163.com'),
                  ),
                  ListTile(
                    title: Text('Title1'),
                  ),
                  ListTile(
                    title: Text('Title2'),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: this._buildBottomAppBar(context),
            persistentFooterButtons: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text('button1'),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('button2'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: _isBottomBarNotched ? CircularNotchedRectangle() : null,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          // Bottom that pops up from the bottom of the screen.
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => Container(
                alignment: Alignment.center,
                height: 200,
                child: Text('Dummy bottom sheet'),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {}
          ),
          IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {}
          ),
        ],
      ),
    );
  }
}

