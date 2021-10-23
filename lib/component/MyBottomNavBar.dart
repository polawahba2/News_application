import 'package:flutter/material.dart';
import 'package:news_app/cubit/NewsAppCupit.dart';

Widget MyBottomNavBar(context) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business '),
      BottomNavigationBarItem(
          icon: Icon(Icons.sports_basketball), label: 'Sports',),
      BottomNavigationBarItem(
          icon: Icon(Icons.phone_iphone), label: 'Technologies'),
    ],
    backgroundColor: Colors.red[700],
    unselectedItemColor:Colors.white,
    selectedItemColor: Colors.yellow,
    currentIndex: NewAppCubit.getCubit(context).bottomNavIndex,
    onTap: (index) {
      NewAppCubit.getCubit(context).changeBottomNavIndex(index);
    },
  );
}
