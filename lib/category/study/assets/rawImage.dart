import 'dart:ui' as ui;
import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RawImagePage extends StatefulWidget {
  @override
  _RawImagePageState createState() => _RawImagePageState();
}

class _RawImagePageState extends State<RawImagePage> {

  ui.Image _img;

  @override
  void initState() {
    super.initState();
    _loadImageByAsset('images/owl.jpg').then((_urlImage) {
      setState(() => _img = _urlImage);
    });
  }

  Future<ui.Image> _loadImageByAsset(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TitleWidget('RawImage基本使用'),
        SubtitleWidget('RawImage是Image的原始实现'),
        Container(
          child: RawImage(image: _img),
        ),
      ],
    );
  }
}
