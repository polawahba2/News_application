import 'package:flutter/material.dart';

class ViewScreen extends StatelessWidget {
  final image;
  final title;
  ViewScreen(
      {this.image =
          'https://image.shutterstock.com/image-vector/picture-vector-icon-no-image-260nw-1732584341.jpg',
      this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  title.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
