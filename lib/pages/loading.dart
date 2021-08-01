import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupBuildOrder() async {

    // Favorite build order name list by user
    List<String> load_favBuildOrderList = [
      'ZvZ 12D 一波',
      'ZvZ 15D 一波',
      'ZvZ 17D 一波',
    ];

    await Future.delayed(Duration(seconds:1), () {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false, arguments: load_favBuildOrderList);
    });
  }

  @override
  void initState() {
    super.initState();
    setupBuildOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            )
        )
    );
  }
}

