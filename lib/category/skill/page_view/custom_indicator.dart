import 'dart:async';

import 'package:back/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';

class CustomIndicatorPage extends StatefulWidget {
  @override
  _CustomIndicatorPageState createState() => _CustomIndicatorPageState();
}

class _CustomIndicatorPageState extends State<CustomIndicatorPage> {
  final List<Widget> _pages = <Widget>[
    ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: FlutterLogo(style: FlutterLogoStyle.markOnly,),
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
    return CustomCarousel(_pages);
  }
}

class CustomCarousel extends StatefulWidget {
  final List imagesList;

  CustomCarousel(this.imagesList);

  @override
  _State createState() => _State();
}

class _State extends State<CustomCarousel> {
  final PageController _pageController =
      PageController(initialPage: 1, viewportFraction: 1.0);
  int _currentIndex = 1;

  List get _images => widget.imagesList;

  Timer _timer;

  @override
  void initState() {
    _setTimer();
    super.initState();
  }

//设置定时器
  void _setTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 3500), (_) {
      _pageController.animateToPage(_currentIndex + 1,
          duration: Duration(milliseconds: 850), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    var addedImages = [];
    if (_images.isNotEmpty) {
      addedImages
        ..add(_images[_images.length - 1])
        ..addAll(_images)
        ..add(_images[0]);
    }

    var ratio = 2 / 5;

    return Center(
      child: AspectRatio(
        aspectRatio: ratio,
        child: Stack(
          children: [
            NotificationListener(
              onNotification: (ScrollNotification notification) {
                if (notification.depth == 0 &&
                    notification is ScrollStartNotification) {
                  if (notification.dragDetails != null) {
                    _timer.cancel();
                  }
                } else if (notification is ScrollEndNotification) {
                  _timer.cancel();
                  _setTimer();
                }
                return true;
              },
              child: _images.isNotEmpty
                  ? CustomPageView(
                      physics: BouncingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (page) {
                        int newIndex;
                        if (page == addedImages.length - 1) {
                          newIndex = 1;
                          _pageController.jumpToPage(newIndex);
                        } else if (page == 0) {
                          newIndex = addedImages.length - 2;
                          _pageController.jumpToPage(newIndex);
                        } else {
                          newIndex = page;
                        }
                        setState(() {
                          _currentIndex = newIndex;
                        });
                      },
                      children: addedImages
                          .map((item) => GestureDetector(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  child: addedImages[_currentIndex],
                                ),
                              ))
                          .toList(),
                    )
                  : Container(),
            ),
            Positioned(
              bottom: 60.0,
              left: 0,
              right: 0,
              child: PointIndicator(
                controller: _pageController,
                itemCount: _images.length,
              ),
            ),
            Positioned(
              bottom: 15.0,
              left: 0,
              right: 0,
              child: PointIndicator(
                controller: _pageController,
                itemCount: _images.length,
                icon: Icons.home,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: _images
              //       .asMap()
              //       .map((i, v) =>
              //           MapEntry(i, _buildPoint(_currentIndex == i + 1)))
              //       .values
              //       .toList(),
              // ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class PointIndicator extends StatelessWidget {
  PointIndicator({
    this.controller,
    this.icon,
    this.itemCount = 0,
  });

  /// 自定义图标
  final IconData icon;

  /// PageView的控制器
  final PageController controller;

  /// 指示器的个数
  final int itemCount;

  final Color selectedColor = Color.fromRGBO(25, 25, 112, 1);
  final Color normalColor = Color.fromRGBO(65, 105, 225, 1);

  final double size = 6.0;
  final double spacing = 5.0;

  Widget _buildPointIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    var isCurrentPageSelected = index ==
        (controller.page != null ? controller.page.round() % pageCount : 0);
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 250),
      child: isCurrentPageSelected
          ? Container(
              height: dotSize,
              width: dotSize + (2 * spacing),
              key: ValueKey<String>('${isCurrentPageSelected}_selected'),
              child: Center(
                child: Container(
                  width: dotSize * 2.5,
                  height: dotSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: selectedColor),
                  child: icon == null ? Container(): Icon(icon),
                ),
              ),
            )
          : Container(
              height: dotSize,
              width: dotSize + (2 * spacing),
              key: ValueKey<String>('${isCurrentPageSelected}_selected'),
              child: Center(
                child: Material(
                  color: normalColor,
                  type: MaterialType.circle,
                  child: Container(
                    width: dotSize,
                    height: dotSize,
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildPointIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}
