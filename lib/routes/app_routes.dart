import 'package:flutter/material.dart';
import 'package:praktek/Latihan/Latihan3.dart';
import 'package:praktek/Latihan/Latihan4.dart';
import 'package:praktek/Latihan/Latihan5.dart';
import 'package:praktek/Latihan/Latihan6.dart';
import 'package:praktek/Latihan/LatihanContainer.dart';
import 'package:praktek/Latihan/LatihanContainer2.dart';
import 'package:praktek/pages/home_page.dart';
import 'package:praktek/pages/input_form.dart';
import 'package:praktek/pages/input_eskul.dart';
import 'package:praktek/list-view/ListView.dart';
import 'package:praktek/list-view/SinglechildScroll.dart';

class AppRoutes {
  static const home = '/';
  static const about = '/about';
  static const inputform = '/input-form';
  static const inputeskul = '/input-eskul';
  static const listView = '/list-view';
  static const singlechild = '/singlechild';
  static const latihan3 = '/latihan-3';
  static const latihan4 = '/latihan-4';
  static const latihan5 = '/latihan-5';
  static const latihan6 = '/latihan-6';
  static const latihanContainer = '/latihan-container';
  static const latihanContainer2 = '/latihan-container-2';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    about: (context) => const Scaffold(),
    inputeskul: (context) => const FormPageEskul(),
    inputform: (context) => const FormPage(),
    listView: (context) => const Listview(),
    singlechild: (context) => const SingleScroll(),
    latihan3: (context) => const Latihan3(),
    latihan4: (context) => const Latihan4(),
    latihan5: (context) => const Latihan5(),
    latihan6: (context) => const Latihan6(),
    latihanContainer: (context) => const LatihanContainer(),
    latihanContainer2: (context) => const LatihanContainer2(),
  };
}
