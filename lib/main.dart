import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'DioHelper.dart';
import 'Home.dart';
import 'cubit/MyBlockObserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.initialize();
  runApp(MaterialApp(
    theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.red[700])),
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
