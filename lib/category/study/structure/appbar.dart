
import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        TitleWidget('Appbar基本使用'),
        SubtitleWidget("基本Appbar"),
        AppBar(
          title: Text('Appbar Title'),
          backgroundColor: Colors.cyan,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.access_alarm),
              tooltip: 'icon1',
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.access_time),
              tooltip: 'icon2',
              onPressed: () => {},
            ),
          ],
        ),
        SubtitleWidget("居中标题"),
        AppBar(
          title: Text('Center Title'),
          centerTitle: true,
        ),
        SubtitleWidget("列标题"),
        AppBar(
          backgroundColor: Colors.green,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Title',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Subtitle',
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
        SubtitleWidget("图片标题"),
        AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlutterLogo(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Title with image',
                ),
              ),
            ],
          ),
        ),
        SubtitleWidget("基本Appbar"),
        AppBar(
          title: Text('Appbar Title'),
          backgroundColor: Colors.cyan,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.access_alarm),
              tooltip: 'icon1',
              onPressed: () => {},
            ),
            IconButton(
              icon: Icon(Icons.access_time),
              tooltip: 'icon2',
              onPressed: () => {},
            ),
          ],
        ),
        SubtitleWidget("居中标题"),
        AppBar(
          title: Text('Center Title'),
          centerTitle: true,
        ),
        SubtitleWidget("列标题"),
        AppBar(
          backgroundColor: Colors.green,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Title',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Subtitle',
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),
        ),
        SubtitleWidget("自定义样式标题"),
        AppBar(
          title: Text('With Shape'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
        TitleWidget('Appbar With Tabs'),
        Container(
          height: 100,
          child: AppBar(
            title: Text('Title in center'),
            leading: Icon(Icons.home),
            backgroundColor: Colors.purple,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                tooltip: 'icon1',
                onPressed: () {},
              ),
              PopupMenuButton<String>(
                  itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                      value: 'item1',
                      child: Text('item1 value'),
                    ),
                    PopupMenuItem<String>(
                      value: 'item2',
                      child: Text('item2 value'),
                    ),
                  ],
                  onSelected: (String action) {})
            ],
            bottom: TabBar(
              isScrollable: true,
              controller: _tabController,
              tabs: <Widget>[
                Tab(text: 'Tabs 1'),
                Tab(text: 'Tabs 2'),
                Tab(text: 'Tabs 3'),
                Tab(text: 'Tabs 4'),
                Tab(text: 'Tabs 5'),
              ],
            ),
          ),
        )
      ],
    );
  }
}
