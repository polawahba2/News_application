import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/screens/Business.dart';
import 'package:news_app/screens/Sports.dart';
import 'package:news_app/screens/Tech.dart';

import '../DioHelper.dart';
import 'NewsAppStates.dart';

class NewAppCubit extends Cubit<NewsAppSataes> {
  NewAppCubit() : super(InitialState());
  List<String> appBarTitle = [
    'Business News',
    'Sports News',
    'Tech News',
  ];
  List<Widget> myPages = [Business(), Sports(), Tech()];
  int bottomNavIndex = 0;

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> tech = [];

  void changeBottomNavIndex(int index) {
    emit(BottomNavBarChangingIndex());
    bottomNavIndex = index;
  }

  void getNews() {
    emit(LoadingGettingNewsData());
    DioHelper.getData('v2/top-headlines', {
      'country': 'eg',
      'category': 'business',
      'apikey': '7d4d2652d1494e9fa43db1f9f2806836',
    }).then((value) {
      business = value.data['articles'];
      emit(GetNewsDataState());

      // print(business[0]['title']);
    }).catchError((error) {
      print('while getting data this error is happend : $error');
      emit(ErrorGettingNewsData());
    });
  }

  void getSports() {
    emit(LoadingGettingSportsData());
    DioHelper.getData('v2/top-headlines', {
      'country': 'eg',
      'category': 'sport',
      'apikey': '7d4d2652d1494e9fa43db1f9f2806836',
    }).then((value) {
      sports = value.data['articles'];
      emit(GetSportsDataState());

      // print(sports[0]['title']);
    }).catchError((error) {
      print('while getting data this error is happend : $error');
      emit(ErrorGettingSportsData());
    });
  }

  void getTech() {
    emit(LoadingGettingTechData());
    DioHelper.getData('v2/top-headlines', {
      'sources': 'techcrunch',
      'apikey': '7d4d2652d1494e9fa43db1f9f2806836',
    }).then((value) {
      tech = value.data['articles'];
      emit(GetTechDataState());

      // print(tech[0]['title']);
    }).catchError((error) {
      print('while getting data this error is happend : $error');
      emit(ErrorGettingTechData());
    });
  }

  static NewAppCubit getCubit(context) {
    return BlocProvider.of(context);
  }
}



