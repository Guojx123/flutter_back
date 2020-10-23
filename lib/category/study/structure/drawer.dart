import 'package:back/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  bool isDrawerOpen= false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Drawer 基本使用"),
      ),
      body: Column(
        children: <Widget>[
          SubtitleWidget("按钮控制打开抽屉"),
          RaisedButton(
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
              isDrawerOpen = true;
            },
            child: Text('打开抽屉'),
          ),
          RaisedButton(
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
              isDrawerOpen = true;
            },
            child: Text('打开end抽屉'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _drawerHeader(),
            ListTile(
              title: Text("title1"),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              title: Text("title2"),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              trailing: Text("关闭抽屉"),
              onTap: (){
                if(isDrawerOpen)
                  Navigator.of(context).pop();
              },
            ),
            AboutListTile(
              icon: new CircleAvatar(child: new Text("Ab")),
              child: new Text("About"),
              applicationName: "Flutter Back",
              applicationVersion: "1.0",
              applicationIcon: new Image.asset(
                "images/uikit_bg.jpg",
                width: 64.0,
                height: 64.0,
              ),
              applicationLegalese: "applicationLegalese",
              aboutBoxChildren: <Widget>[
                new Text("BoxChildren"),
                new Text("box child 2")
              ],
              dense: false,
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _drawerHeader(),
            ListTile(
              title: Text("title1"),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              title: Text("title2"),
              trailing: Icon(Icons.chevron_right),
            ),
            ListTile(
              trailing: Text("关闭抽屉"),
              onTap: (){
                if(isDrawerOpen)
                  Navigator.of(context).pop();
              },
            ),
            AboutListTile(
              icon: new CircleAvatar(child: new Text("Ab")),
              child: new Text("About"),
              applicationName: "Flutter Back",
              applicationVersion: "1.0",
              applicationIcon: new Image.asset(
                "images/uikit_bg.jpg",
                width: 64.0,
                height: 64.0,
              ),
              applicationLegalese: "applicationLegalese",
              aboutBoxChildren: <Widget>[
                new Text("BoxChildren"),
                new Text("box child 2")
              ],
              dense: false,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
      accountName: new Text(
        "Guojunxian",
      ),
      accountEmail: new Text(
        "hdb41348@163.com",
      ),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: new AssetImage("images/uikit_bg.jpg"),
      ),
      onDetailsPressed: () {},
      otherAccountsPictures: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage("images/uikit_bg.jpg"),
        ),
      ],
    );
  }
}
