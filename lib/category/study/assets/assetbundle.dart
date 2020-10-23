import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetsBundlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TitleWidget('通过rootBundle获取asset'),
        Container(
          child: FutureBuilder(
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
            future: loadAsset(),
          ),
        ),
        TitleWidget('通过DefaultAssetBundle获取asset'),
        Container(
          child: FutureBuilder(
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            },
            future: loadAssetDefault(context),
          ),
        ),
      ],
    );
  }

  Future<String> loadAsset() async {
    return await rootBundle.loadString('lib/category/study/assets/easeImport.dart');
  }

  Future<String> loadAssetDefault(BuildContext context) async {
    return await DefaultAssetBundle.of(context).loadString('lib/category/study/assets/easeImport.dart');
  }

}
