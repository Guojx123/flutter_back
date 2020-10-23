import 'package:back/utils/markdown/widget_markdown_page.dart';
import 'package:flutter/material.dart';

class MainPagePageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          height: kToolbarHeight,
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SearchMainPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 16),
                  child: Hero(
                    tag: 'search',
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => FeedMainPage()));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MarkdownPage("lib/category/study/config/" + 'test'),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.rss_feed,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMeWidget()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kToolbarHeight / 6),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              width: 64,
            ),
            SizedBox(width: 16),
            Text(
              'Flutter Back',
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
