import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/MyBottomNavBar.dart';
import 'package:news_app/cubit/NewsAppCupit.dart';

import 'cubit/NewsAppStates.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (BuildContext context) => NewAppCubit()..getNews(),
      child: BlocConsumer<NewAppCubit, NewsAppSataes>(
        listener: (context, states) {},
        builder: (context, states) {
          var myCubit = NewAppCubit.getCubit(context);
          return Scaffold(
            appBar: AppBar(
              // centerTitle: true,
              title: Text(
                myCubit.appBarTitle[myCubit.bottomNavIndex],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: myCubit.myPages[myCubit.bottomNavIndex],
            bottomNavigationBar: MyBottomNavBar(context),
          );
        },
      ),
    );
  }
}
