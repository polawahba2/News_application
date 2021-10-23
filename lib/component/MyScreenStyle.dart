import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'PageView.dart';

Widget MyScreenStyle(List categoryList, context) {
  var size = MediaQuery.of(context).size;
  // var myCubit = NewAppCubit.getCubit(context);
  return Scaffold(
    body: ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ViewScreen(
                    image: categoryList[index]['urlToImage'] ??
                        'https://image.shutterstock.com/image-vector/picture-vector-icon-no-image-260nw-1732584341.jpg',
                    title: categoryList[index]['description'],
                  );
                }));
              },
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.33,
                    height: size.height * 0.18,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            categoryList[index]['urlToImage'] ??
                                'https://image.shutterstock.com/image-vector/picture-vector-icon-no-image-260nw-1732584341.jpg',
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadiusDirectional.circular(20),
                    ),
                  ),
                  // SizedBox(
                  //   width: size.width * 0.03,
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              categoryList[index]['title'] ?? 'UnKnown',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              categoryList[index]['author'] ?? 'UnKnown',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            color: Colors.grey,
            width: double.infinity,
            height: 1,
          );
        },
        itemCount: categoryList.length),
  );
}
