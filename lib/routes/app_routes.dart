import 'package:flutter/material.dart';
import 'package:praktek/Latihan/latihan_3.dart';
import 'package:praktek/Latihan/latihan_4.dart';
import 'package:praktek/Latihan/latihan_5.dart';
import 'package:praktek/Latihan/latihan_6.dart';
import 'package:praktek/Latihan/latihan_container.dart';
import 'package:praktek/Latihan/latihan_container_2.dart';
import 'package:praktek/pages/home_page.dart';
import 'package:praktek/pages/elektronik/daftar_item_page.dart';
import 'package:praktek/pages/input_form.dart';
import 'package:praktek/pages/input_eskul.dart';
import 'package:praktek/list-view/list_view.dart';
import 'package:praktek/list-view/grid_view.dart';
import 'package:praktek/list-view/singlechild_scroll.dart';
import 'package:praktek/pages/album_page.dart';
import 'package:praktek/pages/post_page.dart';

class AppRoutes {
  static const home = '/';
  static const store = '/store';
  static const about = '/about';
  static const inputform = '/input-form';
  static const inputeskul = '/input-eskul';
  static const listView = '/list-view';
  static const gridView = '/grid-view';
  static const singlechild = '/singlechild';
  static const latihan3 = '/latihan-3';
  static const latihan4 = '/latihan-4';
  static const latihan5 = '/latihan-5';
  static const latihan6 = '/latihan-6';
  static const latihanContainer = '/latihan-container';
  static const latihanContainer2 = '/latihan-container-2';
  static const album = '/album';
  static const posts = '/posts';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    store: (context) => const DaftarItemPage(),
    about: (context) => const Scaffold(),
    inputeskul: (context) => const FormPageEskul(),
    inputform: (context) => const FormPage(),
    listView: (context) => const Listview(),
    gridView: (context) => const Gridview(),
    singlechild: (context) => const SingleScroll(),
    latihan3: (context) => const Latihan3(),
    latihan4: (context) => const Latihan4(),
    latihan5: (context) => const Latihan5(),
    latihan6: (context) => const Latihan6(),
    latihanContainer: (context) => const LatihanContainer(),
    latihanContainer2: (context) => const LatihanContainer2(),
    album: (context) => const AlbumPage(),
    posts: (context) => const PostPage(),
  };
}
