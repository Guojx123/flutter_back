import 'package:back/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';

class NavigationRailPage extends StatefulWidget {
  @override
  _NavigationRailPageState createState() => _NavigationRailPageState();
}

class _NavigationRailPageState extends State<NavigationRailPage> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        NavigationRail(
          elevation: 2,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() => _selectedIndex = index);
          },
          leading: IconButton(
            icon: Icon(Icons.tune),
            color: Colors.red.shade300,
            onPressed: () {
              print("deBug");
            },
          ),
          labelType: NavigationRailLabelType.selected,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: Text('First'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.bookmark_border),
              selectedIcon: Icon(Icons.book),
              label: Text('Second'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.star_border),
              selectedIcon: Icon(Icons.star),
              label: Text('Third'),
            ),
          ],
        ),
        VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        TextSpan(
                          text: "页面下标 ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        TextSpan(
                          text: 'selectedIndex: $_selectedIndex',
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
