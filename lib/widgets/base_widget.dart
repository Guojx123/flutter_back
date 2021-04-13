import 'package:back/Utils/widget_with_codeview-1.0.3/widget_with_codeview.dart';
import 'package:back/Widgets/sp_util.dart';
import 'package:back/utils/markdown/widget_markdown_page.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class BaseWidget extends StatefulWidget {
  final String title;
  final Widget widget;
  final String codePath;
  final bool isMarkDown;

  BaseWidget(this.title, this.codePath, this.widget,{this.isMarkDown = false});

  @override
  _BaseWidgetState createState() {
    return _BaseWidgetState();
  }
}

const GITHUB_URL = 'https://github.com/ggjx/flutter_back';

class _BaseWidgetState extends State<BaseWidget> {
  List<String> collects;
  bool collected = false;

  @override
  Widget build(BuildContext context) {
    collects = List<String>.from(SpUtil.getStringList('collects'));
    collected = collects.indexWhere((element) => element == widget.title) != -1;
    final mediaQuery = MediaQuery.of(context);
    final contentHeight = mediaQuery.size.height - mediaQuery.padding.top - mediaQuery.padding.bottom - kToolbarHeight;
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, '');
        return Future.value(true);
      },
      child: !widget.isMarkDown ?
      Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE6EBEB),
          elevation: 0,
          leading: IconButton(
            icon: const BackButtonIcon(),
            color: Colors.teal.withOpacity(0.8),
            onPressed: () {
              Navigator.maybePop(context, null);
            },
          ),
          brightness: Brightness.light,
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(collected ? Icons.star : Icons.star_border),
            //   color: Colors.black54,
            //   onPressed: () {
            //     if (mounted) {
            //       setState(() {
            //         if (collected) {
            //           collects.remove(widget.title);
            //         } else {
            //           collects.add(widget.title);
            //         }
            //         SpUtil.putStringList('collects', collects);
            //       });
            //     }
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.code),
              color: Colors.black54,
              onPressed: () {
                if(widget.isMarkDown){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MarkdownPage(widget.codePath),
                    ),
                  );
                }else{
                  debugPrint('Gino codePath -> ${widget.codePath}');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WidgetWithCodeView(
                        title: widget.title,
                        sourceFilePath: widget.codePath + '.dart',
                        codeLinkPrefix: '$GITHUB_URL/blob/master',
                      ),
                    ),
                  );
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.share),
              color: Colors.black54,
              onPressed: () {
                String path = widget.codePath + '.dart';
                getExampleCode(context, path, DefaultAssetBundle.of(context)).then<void>((String code) {
                  var shareText = code ?? 'Example code not found';
                  Share.share(shareText);
                });
              },
            ),
          ],
        ),
        body: Container(
          color: Color(0xFFE6EBEB),
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          height: contentHeight,
          child: Material(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
              bottom: Radius.circular(2.0),
            ),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: Text(widget.title),
              ),
              body: Container(
                margin: EdgeInsets.all(16),
                child: widget.widget,
              ),
            ),
          ),
        ),
      ) : MarkdownPage(widget.codePath+".txt",title: widget.title,),
    );
  }
}

