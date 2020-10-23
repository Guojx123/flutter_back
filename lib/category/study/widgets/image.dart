import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:back/widgets/multi_selection_widget.dart';
import 'package:back/widgets/subtitle_widget.dart';
import 'package:back/widgets/title_widget.dart';
import 'package:flutter/material.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {

  var colorBlendModesSelection = BlendMode.dst;

  Image preCacheImage;
  Uint8List bmp;
  BMP332Header header;
  Random r = Random();
  BoxFit fit = BoxFit.none;
  ImageRepeat repeat = ImageRepeat.repeatX;

  @override
  void initState() {
    super.initState();
    preCacheImage = Image.asset(
      'images/owl.jpg',
      height: 300,
      width: 300,
    );
    header = BMP332Header(100, 100);
    bmp = header.appendBitmap(
      Uint8List.fromList(List<int>.generate(10000, (i) => r.nextInt(255))),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(preCacheImage.image, context);
  }

  Future<ui.Image> _getImage() {
    Completer<ui.Image> completer = Completer<ui.Image>();
    Image image = Image.asset('images/owl.jpg');
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
            (ImageInfo info, bool _) {
          completer.complete(info.image);
        },
      ),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TitleWidget('Image From Asset'),
        SubtitleWidget('gaplessPlayback可以在新图出现前保持旧的图 防止图片快速切换时图片闪烁'),
        Image(
          image: AssetImage('images/owl.jpg'),
          height: 300,
          width: 300,
          gaplessPlayback: true,
        ),
        TitleWidget('Image From Net with progress'),
        Image.network(
          'https://img.favpng.com/25/9/1/dart-google-developers-flutter-android-png-favpng-vi7iwNmVaBCVr91EF35XrnFfc.jpg',
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null,
              ),
            );
          },
        ),
        TitleWidget('Image From Net with frameBuilder'),
        Image.network(
          'https://img.favpng.com/25/9/1/dart-google-developers-flutter-android-png-favpng-vi7iwNmVaBCVr91EF35XrnFfc.jpg',
          frameBuilder: (BuildContext context, Widget child, int frame, bool wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              return child;
            }
            return AnimatedOpacity(
              child: child,
              opacity: frame == null ? 0 : 1,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
            );
          },
        ),
        TitleWidget('PrecacheImage 预缓存图片'),
        preCacheImage,
        TitleWidget('Image tint 图片着色'),
        Image(
          image: AssetImage('images/logo.png'),
          height: 150,
          width: 150,
          color: Colors.cyan,
        ),
        TitleWidget('Image BoxFit'),
        SubtitleWidget('BoxFit.none的裁减方式与Alignment的参数相关'),
        Align(
          child: Container(
            width: 150,
            height: 250,
            color: Colors.blueAccent,
            child: Image.asset(
              'images/owl.jpg',
              fit: fit,
            ),
          ),
        ),
        MultiSelectionWidget('BoxFit', BoxFit.values, BoxFit.values, (value) {
          setState(() => fit = value);
        }),
        TitleWidget('Image Repeat 重复图片'),
        Image.asset(
          'images/owl.jpg',
          width: double.infinity,
          height: 150,
          repeat: repeat,
        ),
        MultiSelectionWidget(
          'Repeat',
          ImageRepeat.values,
          ImageRepeat.values,
              (value) => setState(() => repeat = value),
        ),
        TitleWidget('Image ColorBlendModes 色彩混合模式'),
        Image(
          image: AssetImage('images/logo.png'),
          height: 150,
          width: 150,
          color: Colors.red,
          colorBlendMode: colorBlendModesSelection,
        ),
        MultiSelectionWidget(
          'BlendMode',
          BlendMode.values,
          BlendMode.values.map((value) {
            return value.toString().split('.')[1];
          }).toList(),
              (value) {
            setState(() => colorBlendModesSelection = value);
          },
        ),
        TitleWidget('Image Direction 图片方向'),
        Row(
          children: <Widget>[
            Directionality(
              textDirection: TextDirection.ltr,
              child: Image.asset(
                'images/logo.png',
                height: 150,
                width: 150,
                matchTextDirection: true,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Image.asset(
                'images/logo.png',
                width: 150,
                height: 150,
                matchTextDirection: true,
              ),
            ),
          ],
        ),
        TitleWidget('Get Image Size 获取图片尺寸'),
        FutureBuilder<ui.Image>(
          future: _getImage(),
          builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Image Size : ${snapshot.data.width}x${snapshot.data.height} on Path images/owl.jpg',
                style: TextStyle(fontSize: 24, color: Colors.black),
              );
            } else {
              return Text('Loading...');
            }
          },
        ),
        TitleWidget('Get Image from memory 从内存获取图片'),
        Image.memory(bmp),
        SubtitleWidget('原图大小为70x70，指定centerSlice Rect为中间长度为20的矩形'),
        Center(
          child: Image.asset(
            'images/yidong.png',
            width: 200,
            height: 200,
            centerSlice: Rect.fromCircle(center: const Offset(35, 35), radius: 10),
          ),
        ),
        SubtitleWidget("左边为原图，效果是左右镜像"),
        Row(
          children: <Widget>[
            Image.asset(
                "images/logo.png",
              height: 125,
            ),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Image.asset(
                  'images/logo.png',
                  height: 125,
                  matchTextDirection: true,
                )),
          ],
        ),
        SubtitleWidget("图片的淡入淡出效果"),
        Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg',
          frameBuilder: (BuildContext context, Widget child, int frame,
              bool wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) {
              return child;
            }
            return AnimatedOpacity(
              child: child,
              opacity: frame == null ? 0 : 1,
              duration: const Duration(seconds: 2),
              curve: Curves.easeOut,
            );
          },
        ),
        SubtitleWidget("图片加载进度条"),
        Image.network(
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/puffin.jpg',
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            }),
        TitleWidget('Image CenterSlice 图片中心'),
        SubtitleWidget('图像的显示大小必须大于原图！'),
        Center(
          child: Image.asset(
            'images/yidong.png',
            width: 200,
            height: 200,
          ),
        ),

        ///
        /// 当Image原图显示时，区域5即是centerSlice的参数Rect指定的矩形区域，与其它区域共被分为9份
        ///
        //-------------------
        //|  1  |  2  |  3  |
        //-------------------
        //|  4  |  5  |  6  |
        //-------------------
        //|  7  |  8  |  9  |
        //-------------------
        ///
        /// 由于显示图区域大于原图，所以原图会被拉伸
        ///
        //-------        -------        -------
        //|  1  |        |  2  |        |  3  |
        //-------        -------        -------
        //
        //
        //-------        -------        -------
        //|  4  |        |  5  |        |  6  |
        //-------        -------        -------
        //
        //
        //-------        -------        -------
        //|  7  |        |  8  |        |  9  |
        //-------        -------        -------
        ///
        /// 四角区域1、3、7、9原样显示，区域4、6被上下拉伸填充，区域2、8被左右拉伸填充，区域5上下左右拉伸填充
        ///
        //-------------------------------
        //|  1  |        2        |  3  |
        //-------------------------------
        //|     |                 |     |
        //|     |                 |     |
        //|     |                 |     |
        //|  4  |        5        |  6  |
        //|     |                 |     |
        //|     |                 |     |
        //|     |                 |     |
        //-------------------------------
        //|  7  |        8        |  9  |
        //-------------------------------
      ],
    );
  }
}

class BMP332Header {
  int _width; // NOTE: width must be multiple of 4 as no account is made for bitmap padding
  int _height;
  Uint8List _bmp;
  int _totalHeaderSize;

  BMP332Header(this._width, this._height) : assert(_width & 3 == 0) {
    int baseHeaderSize = 54;
    _totalHeaderSize = baseHeaderSize + 1024; // base + color map
    int fileLength = _totalHeaderSize + _width * _height; // header + bitmap
    _bmp = Uint8List(fileLength);
    ByteData bd = _bmp.buffer.asByteData();
    bd.setUint8(0, 0x42);
    bd.setUint8(1, 0x4d);
    bd.setUint32(2, fileLength, Endian.little); // file length
    bd.setUint32(10, _totalHeaderSize, Endian.little); // start of the bitmap
    bd.setUint32(14, 40, Endian.little); // info header size
    bd.setUint32(18, _width, Endian.little);
    bd.setUint32(22, _height, Endian.little);
    bd.setUint16(26, 1, Endian.little); // planes
    bd.setUint32(28, 8, Endian.little); // bpp
    bd.setUint32(30, 0, Endian.little); // compression
    bd.setUint32(34, _width * _height, Endian.little); // bitmap size
    // leave everything else as zero
    // there are 256 possible variations of pixel
    // build the indexed color map that maps from packed byte to RGBA32
    // better still, create a lookup table see: http://unwind.se/bgr233/
    for (int rgb = 0; rgb < 256; rgb++) {
      int offset = baseHeaderSize + rgb * 4;
      int red = rgb & 0xe0;
      int green = rgb << 3 & 0xe0;
      int blue = rgb & 6 & 0xc0;
      bd.setUint8(offset + 3, 255); // A
      bd.setUint8(offset + 2, red); // R
      bd.setUint8(offset + 1, green); // G
      bd.setUint8(offset, blue); // B
    }
  }

  /// Insert the provided bitmap after the header and return the whole BMP
  Uint8List appendBitmap(Uint8List bitmap) {
    int size = _width * _height;
    assert(bitmap.length == size);
    _bmp.setRange(_totalHeaderSize, _totalHeaderSize + size, bitmap);
    return _bmp;
  }
}

