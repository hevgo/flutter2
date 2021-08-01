import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    var favBuildOrderList = ModalRoute.of(context)!.settings.arguments as List<String>;

    // HomeArguments argsHome= HomeArguments(favBuildOrderList: [], allBuildOrders: [], allBuildOrderList: []);

    List<Widget> homeWidgetList = [];
    for(var i=0; i<favBuildOrderList.length; i++){
      homeWidgetList.add(SizedBox(height: 18.0,));
      homeWidgetList.add(
        Container(
          padding: EdgeInsets.all(15.0),
          color: Colors.blue,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/build_order_action', arguments: favBuildOrderList[i]);
            },
            child: Text(favBuildOrderList[i],
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Colors.black,
              ),
            ),
          ),
        ),
      );
    }
    homeWidgetList.add(SizedBox(height: 18.0,));
    homeWidgetList.add(
      Container(
        padding: EdgeInsets.all(15.0),
        color: Colors.blue,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/build_order_list', arguments: favBuildOrderList);
          },
          child: Text('添加 ${favBuildOrderList.length}',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
    homeWidgetList.add(SizedBox(height: 18.0,));
    homeWidgetList.add(
      Container(
        padding: EdgeInsets.all(15.0),
        color: Colors.blue,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/build_order_list_delete', arguments: favBuildOrderList);
          },
          child: Text('删除 ${favBuildOrderList.length}',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('星际2 流程 助手'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: homeWidgetList,
        ),
      ),
    );
  }
}