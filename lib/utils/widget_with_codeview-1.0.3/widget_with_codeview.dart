library widget_with_codeview;

import 'package:flutter/material.dart';

import 'source_code_view.dart';

class WidgetWithCodeView extends StatelessWidget {
  // Path of source file (relative to project root). The file's content will be
  // shown in the "Code" tab.
  final String sourceFilePath;
  final Widget child;
  final String codeLinkPrefix;
  final String title;

  const WidgetWithCodeView({
    Key key,
    @required this.child,
    @required this.sourceFilePath,
    this.codeLinkPrefix,
    this.title,
  }) : super(key: key);

  String get routeName => '/${this.runtimeType.toString()}';

  Widget get sourceCodeView => SourceCodeView(
      filePath: this.sourceFilePath, codeLinkPrefix: this.codeLinkPrefix);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${title?? ""} CodeView "),
      ),
      body: AlwaysAliveWidget(child: this.sourceCodeView),
    );
  }
}

// This widget is always kept alive, so that when tab is switched back, its
// child's state is still preserved.
class AlwaysAliveWidget extends StatefulWidget {
  final Widget child;

  const AlwaysAliveWidget({Key key, @required this.child}) : super(key: key);

  @override
  AlwaysAliveWidgetState createState() => AlwaysAliveWidgetState();
}

class AlwaysAliveWidgetState extends State<AlwaysAliveWidget>
    with AutomaticKeepAliveClientMixin<AlwaysAliveWidget> {
  @override
  Widget build(BuildContext context) {
    super.build(context); // This build method is annotated "@mustCallSuper".
    return this.widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}

