import 'package:flutter/material.dart';

class tonyPage extends StatelessWidget {
  const tonyPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        //color: Colors.black,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/474x/ac/3b/e1/ac3be1493b62fa4ef3041b64c8b7ee17.jpg"),
                fit: BoxFit.cover)),
      ),
      Container(
          child: Center(
              child: Text(
        "G A M E     L O S T",
        style: TextStyle(
          color: Colors.white,
        ),
      ))),
    ]);
  }
}
