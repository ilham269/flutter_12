import 'package:flutter/material.dart';
import 'package:praktek/list-view/ListView.dart';
import 'package:praktek/list-view/SinglechildScroll.dart';
import 'package:praktek/pages/about_page.dart';
import 'package:praktek/pages/home_page.dart';

class AppRoutes {
  static const home = '/';
  static const listView = '/list-view';
  static const String singlechild = '/single-child-scroll';
  static const about = '/about';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomePage(),
    singlechild: (context) => SingleChildScrollView(),
    listView: (context) => Listview(),
    about: (context) => AboutPage(),
  };
}
