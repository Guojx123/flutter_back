import 'package:flutter/material.dart';
import 'dart:math';

class  IndicatorPage extends StatefulWidget {
  @override
  State createState() =>  IndicatorPageState();
}

class  IndicatorPageState extends State< IndicatorPage> {
  final _controller = PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.8);

  final List<Widget> _pages = <Widget>[
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: FlutterLogo(),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: FlutterLogo(style: FlutterLogoStyle.stacked),
    ),
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: FlutterLogo(style: FlutterLogoStyle.horizontal),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconTheme(
        data: IconThemeData(color: _kArrowColor),
        child: Stack(
          children: <Widget>[
            PageView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
            Positioned(
              bottom: 80.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: Colors.grey[800].withOpacity(0.5),
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: DotsIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                color: Colors.grey[800].withOpacity(0.5),
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: LineIndicator(
                    controller: _controller,
                    itemCount: _pages.length,
                    onPageSelected: (int page) {
                      _controller.animateToPage(
                        page,
                        duration: _kDuration,
                        curve: _kCurve,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

// The base size of the dots
  static const double _kDotSize = 8.0;

// The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

// The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index, int pageCount) {
// 当前位置
    double currentPosition =
        ((controller.page ?? controller.initialPage.toDouble()) %
            pageCount.toDouble());

// 计算变化曲线
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - (currentPosition - index).abs(),
      ),
    );

// 从0点跳到最后一个时状态需要特殊处理
    if (currentPosition > pageCount - 1 && index == 0) {
      selectedness = 1 - (pageCount.toDouble() - currentPosition);
    }

    print('selectedness $index');
    print('selectedness $selectedness');
    print('selectedness $controller.page');
    print('selectedness $controller.initialPage');

// 计算缩放大小
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildDot(index, itemCount);
      }),
    );
  }
}

class LineIndicator extends AnimatedWidget {
  LineIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.white,
  }) : super(listenable: controller);

  final PageController controller;

  final int itemCount;

  final ValueChanged<int> onPageSelected;

  final Color color;

  static const double _kDotSize = 8.0;

  static const double _kMaxWidth = 2.0;

  static const double _kDotSpacing = 20.0;

  Widget _buildDot(int index, int pageCount) {
// 当前位置
    double currentPosition =
        ((controller.page ?? controller.initialPage.toDouble()) %
            pageCount.toDouble());

// 计算变化曲线
    double selectness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - (currentPosition - index).abs(),
      ),
    );

// 从0点跳到最后一个时状态需要特殊处理
    if (currentPosition > pageCount - 1 && index == 0) {
      selectness = 1 - (pageCount.toDouble() - currentPosition);
    }

// 计算缩放大小
    double zoom = 1.0 + (_kMaxWidth - 1.0) * selectness;
    return Container(
      width: _kDotSpacing,
      child: Center(
        child: Container(
          width: _kDotSize * zoom,
          height: _kDotSize,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(25)
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildDot(index, itemCount);
      }),
    );
  }
}
