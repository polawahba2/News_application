import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/MyScreenStyle.dart';
import 'package:news_app/cubit/NewsAppCupit.dart';
import 'package:news_app/cubit/NewsAppStates.dart';

import '../component/PageView.dart';

class Tech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewAppCubit()..getTech(),
      child: BlocConsumer<NewAppCubit, NewsAppSataes>(
        listener: (context, states) {},
        builder: (context, states) {
          var size = MediaQuery.of(context).size;
          var myCubit = NewAppCubit.getCubit(context);
          if (states is LoadingGettingTechData) {
            return Center(
              child: LinearProgressIndicator(
                color: Colors.red[700],
                backgroundColor: Colors.red[200],
                minHeight: 8,
              ),
            );
          } else {
            return MyScreenStyle(myCubit.tech, context);
          }
        },
      ),
    );
  }
}
