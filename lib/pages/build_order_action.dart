import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/classes/build_order.dart';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';

// import 'package:flutter2/classes/actions.dart';
import 'package:flutter2/functions/time_clock.dart';

import 'package:flutter2/data/all_orders.dart';

class Build_order_action extends StatefulWidget {
  const Build_order_action({Key? key}) : super(key: key);

  @override
  _Build_order_actionState createState() => _Build_order_actionState();
}

class _Build_order_actionState extends State<Build_order_action> {

  int tot_time = 0;
  int N_action = 0;
  int _counter = 0;
  int is_pause = 0;
  Timer _timer = Timer.periodic(Duration(seconds: 0), (timer) { });
  final FlutterTts flutterTts = FlutterTts();

  void initState() {
    super.initState();
    print ("initState Function run");
  }

  // Future _speak() async {
  //   await flutterTts.speak(dual_action[N_action].action);
  // }
  //
  // void _startTimer() {
  //   if (is_pause == 0) {
  //     _counter = dual_action[N_action].time;
  //     _speak();
  //     // flutterTts.speak("Hello");
  //   } else {
  //     is_pause = 0;
  //   }
  //
  //   if (_timer != null) {
  //     _timer.cancel();
  //   }
  //
  //   _timer = Timer.periodic(Duration(seconds: 1), (timer) {
  //     setState(() {
  //       if (_counter > 0) {
  //         _counter--;
  //         tot_time += 1;
  //       } else {
  //         if (N_action >= dual_action.length-1){
  //           _timer.cancel();
  //           flutterTts.speak("good luck, have fun！");
  //         } else {
  //           N_action += 1;
  //           _counter = dual_action[N_action].time;
  //           _speak();
  //           tot_time += 1;
  //         }
  //       }
  //     });
  //   });
  // }

  Future _speak2(List<BuildOrderStep> order_list) async {
    await flutterTts.speak(order_list[N_action].description);
  }

  void _startTimer2(List<BuildOrderStep> order_list) {
    if (is_pause == 0) {
      _counter = order_list[N_action].duration;
      _speak2(order_list);
      // flutterTts.speak("Hello");
    } else {
      is_pause = 0;
    }

    if (_timer != null) {
      _timer.cancel();
    }

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
          tot_time += 1;
        } else {
          if (N_action >= order_list.length-1){
            _timer.cancel();
            flutterTts.speak("good luck, have fun！");
          } else {
            N_action += 1;
            _counter = order_list[N_action].duration;
            _speak2(order_list);
            tot_time += 1;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    var order_name = ModalRoute.of(context)!.settings.arguments as String;
    int i = allBuildOrderList.indexOf(order_name);
    List<BuildOrderStep> order_list = allBuildOrders[i].steps;

    return Scaffold(
      appBar: AppBar(
          title: Text('GLHF!'),
          centerTitle: true,
          backgroundColor: Colors.red[600]
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          //######################### title line ###############################
          Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "${order_list[N_action].supplyNow}/${order_list[N_action].supplyCap} supply",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              color: Colors.grey[600],
                              fontFamily: 'IndieFlower',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            order_name,
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              color: Colors.grey[600],
                              fontFamily: 'IndieFlower',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                          child: Text(
                            getTimeStringFromInt(tot_time),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              color: Colors.grey[600],
                              backgroundColor: Colors.blue[50],
                              fontFamily: 'IndieFlower',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
              )
          ),
          //########################## context #############################
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (_counter > -1)
                    ? Text(
                    order_list[N_action].description + " " + order_list[N_action].shortcut,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    )
                )
                    : Text(
                  "DONE!",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (_counter > -1)
                    ? Text(
                    "${_counter}/${order_list[N_action].duration.toString()}",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    )
                )
                    : Text(
                  "DONE!",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                (_counter > -1)
                    ? Text(
                    order_list[N_action].sideNote,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    )
                )
                    : Text(
                  "DONE!",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
          ),
          //####################### action icons ##############################
          Expanded(
              flex: 1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.lightBlue,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.restart_alt),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                tot_time = 0;
                                N_action = 0;
                                _counter = 0;
                                is_pause = 0;
                                _timer.cancel();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.lightBlue,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                              icon: const Icon(Icons.not_started_outlined),
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  // _startTimer();
                                  _startTimer2(order_list);
                                });
                              }
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Ink(
                          decoration: const ShapeDecoration(
                            color: Colors.lightBlue,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.motion_photos_pause_outlined),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                _timer.cancel();
                                is_pause = 1;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ]
              )
          ),
          //########################### bottom blank #########################
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                  padding: EdgeInsets.all(60.0)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
