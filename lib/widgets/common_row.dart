import 'package:flutter/material.dart';

/// 
/// @author zhengcj
class CommonRow extends StatefulWidget {
  final String title;
  final bool isTitleBold;
  final String content;
  final Function action;
  final double marginVertical;
  final double fontSize;
  final bool isShowArrowIcon;
  final Color contentColor;
  final double contentFontSize;
  final bool hasMarginBottom;
  final TextAlign contentTextAlign;
  final GlobalKey menuKey;
  final Widget contentWidget;
  final CrossAxisAlignment crossAxisAlignment;

  const CommonRow({Key key,
    this.title,
    this.content,
    this.action,
    this.marginVertical,
    this.fontSize,
    this.isTitleBold=true,
    this.isShowArrowIcon=false,
    this.contentColor,
    this.contentFontSize,
    this.hasMarginBottom=true,
    this.contentTextAlign = TextAlign.end,
    this.menuKey,
    this.contentWidget,
    this.crossAxisAlignment=CrossAxisAlignment.start
  }) : super(key: key);
  @override
  _CommonRowState createState() => _CommonRowState();
}

class _CommonRowState extends State<CommonRow> {
  @override
  Widget build(BuildContext context) {
    print(widget.marginVertical);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        if(widget.action!=null){
          widget.action();
        }
      },
      child: Container(
        key: widget.menuKey,

//        height: 50,
//        margin: EdgeInsets.only(bottom: widget.hasMarginBottom?1.5:0),
        padding: EdgeInsets.symmetric(vertical: widget.marginVertical!=null?widget.marginVertical:12,horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: widget.hasMarginBottom?BorderSide(color: Color(0xFFEBEBEB)):BorderSide.none),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: <Widget>[
            Text(
              widget.title??'',
              style: TextStyle(
                  fontSize: widget.fontSize!=null?widget.fontSize:14,
                  fontWeight: widget.isTitleBold?FontWeight.bold:FontWeight.normal
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: widget.contentWidget!=null?widget.contentWidget:Text(
                widget.content??'',
                textAlign: widget.contentTextAlign,
                style: TextStyle(
                    color: widget.contentColor!=null?widget.contentColor:Color(0xFF999999),
                  fontSize: widget.contentColor!=null?widget.contentFontSize:14,
                ),
              ),
            ),
            widget.isShowArrowIcon?SizedBox(
              width: 10,
            ):Container(),
            widget.isShowArrowIcon?Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF999999),
              size: 15,
            ):Container()
          ],
        ),
      ),
    );
  }
}
