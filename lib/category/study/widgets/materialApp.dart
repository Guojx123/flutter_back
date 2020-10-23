import 'package:back/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';

class MaterialAppPage extends StatefulWidget {
  @override
  _MaterialAppPageState createState() => _MaterialAppPageState();
}

class _MaterialAppPageState extends State<MaterialAppPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SubtitleWidget("routes、initialRoute、onGenerateRoute、onUnknownRoute是和路由相关的4个属性，路由简单的理解就是页面，路由的管理通常是指页面的管理，比如跳转、返回等"),
      ],
    );
    // return MaterialApp(
    //     routes: {
    //       '/': (context) => MyHomePage(),
    //       '/Study': (context) => StudyMainPage(),
    //     },
    //     initialRoute: '/',
    //     home: Scaffold(
    //       appBar: AppBar(
    //         title: Text('MaterialApp'),
    //       ),
    //       body:
    //     ),
    //     onGenerateRoute: (RouteSettings routeSettings){
    //       print('onGenerateRoute:$routeSettings');
    //       if(routeSettings.name == 'icon'){
    //         return MaterialPageRoute(builder: (context){
    //           return StudyMainPage();
    //         });
    //       }
    //       return MaterialPageRoute(builder: (context){
    //         return MyHomePage();
    //       });
    //     },
    //     onUnknownRoute: (RouteSettings routeSettings){
    //       print('onUnknownRoute:$routeSettings');
    //       return MaterialPageRoute(builder: (context){
    //         return NotFoundWidget();
    //       });
    //     },
    // );
  }
}
