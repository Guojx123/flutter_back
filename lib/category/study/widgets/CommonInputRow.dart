import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
/// 
/// @author zhengcj
class CommonInputRow extends StatefulWidget {
  final String hintText;
  final TextStyle hintStyle;
  final String title;
  final Color titleColor;
  final double titleFontSize;
  final bool isTitleBold;
  final TextStyle inputStyle;
  final bool isHasBorderBottom;

  final bool obscureText;
  final ValueChanged<String> onChanged;

  final ValueChanged<String> onSubmitted;
  final TextAlign textAlign;

  final TextEditingController controller;

  final TextInputType textInputType;
  final bool autofocus;

  final TextInputAction textInputAction;

  final FocusNode focusNode;

  final int maxLines;

  final List<TextInputFormatter> inputFormatters;

  final EdgeInsets contentPadding;

  CommonInputRow({
    Key key,
    this.hintText,
    this.hintStyle,
    this.title,
    this.titleColor,
    this.titleFontSize,
    this.isTitleBold=true,
    this.inputStyle,
    this.isHasBorderBottom=true,

    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.textAlign = TextAlign.start,
    this.controller,
    this.textInputType = TextInputType.text,
    this.autofocus = false,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.maxLines=1,
    this.contentPadding,
    List<TextInputFormatter> inputFormatters
  }) : inputFormatters = maxLines == 1
      ? (
      <TextInputFormatter>[BlacklistingTextInputFormatter.singleLineFormatter]
        ..addAll(inputFormatters ?? const Iterable<TextInputFormatter>.empty())
  )
      : inputFormatters,
        super(key: key);

  @override
  _CommonInputRowState createState() => _CommonInputRowState();

}

class _CommonInputRowState extends State<CommonInputRow> {
  @override
  Widget build(BuildContext context) {
    return Container(

//                  margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: widget.isHasBorderBottom?BorderSide(color: Color(0xFFEBEBEB)):BorderSide.none),

      ),
      child: Row(
        children: <Widget>[
          Text(
            widget.title??'',
            style: TextStyle(
                color: widget.titleColor!=null?widget.titleColor:Color(0xFF333333),
                fontSize: widget.titleFontSize!=null?widget.titleFontSize:14,
                fontWeight: widget.isTitleBold?FontWeight.bold:FontWeight.normal
            ),
          ),
          SizedBox(width: 15,),
          Expanded(
            child: TextField(
              style: widget.inputStyle!=null?widget.inputStyle:TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 14
              ),
              maxLines: widget.maxLines,
              focusNode: widget.focusNode,
              controller: widget.controller,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              obscureText: widget.obscureText,
              autofocus: widget.autofocus,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              textAlign: widget.textAlign,
              inputFormatters: widget.inputFormatters,
              decoration: new InputDecoration(
                isDense: true,
                contentPadding: widget.contentPadding!=null?widget.contentPadding:EdgeInsets.symmetric(vertical: 15),
                hintText: widget.hintText ?? "",
                hintStyle: widget.hintStyle!=null?widget.hintStyle:TextStyle(
                    color:Color(0xFF999999),
                    fontSize: 14
                ),
                icon:  null,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),

            ),
          ),

        ],
      ),
    );
  }

}