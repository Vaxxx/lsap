import 'package:flutter/material.dart';
import 'package:sapientia/mainScreens/bookmark-page.dart';
import 'package:sapientia/mainScreens/settings-page.dart';
import 'package:sapientia/screens/africa-page.dart';
import 'package:sapientia/screens/business.dart';
import 'package:sapientia/screens/entertainment.dart';
import 'package:sapientia/screens/headlines.dart';
import 'package:sapientia/screens/health-page.dart';
import 'package:sapientia/screens/politics-page.dart';
import 'package:sapientia/screens/sports.dart';
import 'package:sapientia/screens/world-page.dart';
import 'package:sapientia/utilities/constants.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: googleColor),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Sapientia',
                style: TextStyle(
                  color: colorWhite,
                  fontSize: 50,
                  fontFamily: "Pacifico",
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Headlines'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Headlines(),
              ));
            },
          ),
          ListTile(
            title: Text('Politics'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Politics(),
              ));
            },
          ),
          ListTile(
            title: Text('Business'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Business(),
              ));
            },
          ),
          ListTile(
            title: Text('Health'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Health(),
              ));
            },
          ),
          ListTile(
            title: Text('Sports'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Sports(),
              ));
            },
          ),
          ListTile(
            title: Text('Entertainment'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Entertainment(),
              ));
            },
          ),
          ListTile(
            title: Text('Africa'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Africa(),
              ));
            },
          ),
          ListTile(
            title: Text('World'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => World(),
              ));
            },
          ),
          Divider(color: colorDeepBlue),
          ListTile(
            leading: Icon(Icons.search),
            title: Text(''
                'Search'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Settings(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmark_border),
            title: Text('Bookmark'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Bookmark(),
              ));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Settings(),
              ));
            },
          ),
        ],
      ),
    );
  }
}
