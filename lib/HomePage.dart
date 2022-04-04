import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:game1/Birdy.dart';
import 'package:game1/tonyPage.dart';

double valLeft = 200;
double valTop = 50;
bool alive = true;
int aliveInt = 0;
double v1 = 10;
double v2 = 10;
double valBlockLeft = 360;
double valBlockTop = 0;
double valBlock2Top = 250;
double valBlock2Left = 360;
bool status = false;
var periodicTimer;
int count = 0;

class HomePage extends StatefulWidget {
  MainPage createState() => MainPage();
}

class MainPage extends State<HomePage> {
  // void lose() {
  //   setState(() {
  //     if ((valTop - 50) <= valBlock1 && valLeft == (valBlock1 + 50)) {
  //       setState(() {
  //         periodicTimer =
  //             Timer.periodic(const Duration(microseconds: 1), (timer) {
  //           valTop = 600;
  //           timer.cancel();
  //           periodicTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
  //             //if (valTop == 600) {
  //             status = true;
  //             timer.cancel();
  //             //}
  //           });
  //         });
  //       });

  //       print("GAME LOST BY 1");
  //     }
  //   });
  // }

  void lose2() {
    setState(() {
      if ((valTop + 50) >= valBlock2Top && (valLeft + 50) == valBlock2Left) {
        setState(() {
          periodicTimer =
              Timer.periodic(const Duration(microseconds: 1), (timer) {
            valTop = 700;
            timer.cancel();
            periodicTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
              //if (valTop == 600) {
              status = true;
              timer.cancel();
              //}
            });
          });
        });
        print("GAME LOST BY 2");
      }
    });
  }

  void lose3() {
    setState(() {
      if ((valTop - 190) <= valBlockTop && (valLeft + 50) == valBlockLeft) {
        setState(() {
          periodicTimer =
              Timer.periodic(const Duration(microseconds: 1), (timer) {
            valTop = 700;
            timer.cancel();
            periodicTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
              //if (valTop == 600) {
              status = true;
              timer.cancel();
              //}
            });
          });
        });
        print("GAME LOST BY 1");
      }
    });
  }

  void lose() {
    setState(() {
      if (valTop > 800) {
        status = true;
      }
    });
  }

  void start2() {
    setState(() {
      if (!status) {
        setState(() {
          periodicTimer =
              Timer.periodic(const Duration(microseconds: 1), (timer) {
            valTop = 800;
            timer.cancel();
            periodicTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
              if (valTop > 1000) {
                timer.cancel();
              }
            });
          });
        });
      }
    });
  }

  void start() {
    //if (status) {
    if (!status) {
      periodicTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
        setState(() {
          valTop += 2;
        });
        if (valTop > 100) {
          timer.cancel();
        }
        print(valTop);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return status
        ? tonyPage()
        : Column(
            children: [
              Container(
                  height: 550,
                  color: Colors.blue,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        width: 50,
                        height: 50,
                        left: valLeft,
                        top: valTop,
                        //color: Colors.lightBlue,
                        duration: const Duration(seconds: 2),
                        child: GestureDetector(
                            onDoubleTap: () {
                              setState(() {
                                //valTop = valTop - 10;
                                valTop = valTop - 20;
                              });
                            },
                            onTap: () {
                              setState(() {
                                //valTop = valTop - 10;
                                valTop = valTop - 20;
                                lose2();
                                lose3();
                                lose();
                              });
                            },
                            child: Birdy()),
                      ),
                      AnimatedPositioned(
                          left: valBlockLeft,
                          top: valBlockTop,
                          child: Container(
                            color: Colors.lightGreen,
                            height: 200,
                            width: 50,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  start();
                                });
                                //setState(() {
                                //lose();
                                periodicTimer = Timer.periodic(
                                    const Duration(milliseconds: 100), (timer) {
                                  //2
                                  print("VALBLOCK1");
                                  print(valBlockLeft);
                                  setState(() {
                                    //1
                                    valBlockLeft--;
                                    start();
                                    lose3();
                                    lose();
                                  });
                                  if (valBlockLeft <= 0) {
                                    periodicTimer = Timer.periodic(
                                        const Duration(microseconds: 0),
                                        (timer) {
                                      valBlockLeft = 360;
                                      timer.cancel();
                                    });
                                  }
                                });
                                //});
                              },
                            ),
                          ),
                          duration: const Duration(milliseconds: 100)),
                      AnimatedPositioned(
                          top: valBlock2Top,
                          left: valBlock2Left,
                          child: Container(
                            color: Colors.lightGreen,
                            height: 200,
                            width: 50,
                            child: GestureDetector(
                              onTap: () {
                                periodicTimer = Timer.periodic(
                                    const Duration(milliseconds: 100), (timer) {
                                  setState(() {
                                    valBlock2Left--;
                                    //start();
                                    lose2();
                                    lose();
                                  });
                                  if (valBlock2Left <= 0) {
                                    periodicTimer = Timer.periodic(
                                        const Duration(microseconds: 0),
                                        (timer) {
                                      valBlock2Left = 360;
                                      timer.cancel();
                                    });
                                  }
                                });
                              },
                            ),
                          ),
                          duration: const Duration(milliseconds: 100))
                    ],
                  )
                  //her )
                  ),
              Container(
                color: Colors.tealAccent,
                height: 25,
              ),
              Container(
                color: Colors.green,
                height: 250,
              ),
            ],
          );
  }
}
