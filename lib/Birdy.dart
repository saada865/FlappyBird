import 'package:flutter/material.dart';

class Birdy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
          "https://toppng.com/uploads/preview/flappy-bird-no-background-11549936960agq8fxhfbr.png",
        ),
        fit: BoxFit.cover,
      )),
    );
  }
}
