import 'package:flutter/material.dart';
import 'package:wallpaper_app/screen/view/detail_screen.dart';
import 'package:wallpaper_app/screen/view/home_screen.dart';

Map<String,WidgetBuilder>app_routs= {

  "/":(context) => HomeScreen(),
  "detail":(context) => DetailScreen(),

};