import 'package:flutter/material.dart';
import 'package:flutter2/data/all_orders.dart';

class BuildOrderList extends StatefulWidget {
  const BuildOrderList({Key? key}) : super(key: key);

  @override
  _BuildOrderListState createState() => _BuildOrderListState();
}

class _BuildOrderListState extends State<BuildOrderList> {

  @override
  Widget build(BuildContext context) {

    var favBuildOrderList = ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('流程列表'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: allBuildOrderList.length,
        itemBuilder: (context, index) {
          return TextButton.icon(
            onPressed: () {
              String name = '${allBuildOrderList[index]}';
              if (!favBuildOrderList.contains(name)) {
                favBuildOrderList.add(
                    '${allBuildOrderList[index]}');
              }
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false, arguments: favBuildOrderList);

              // Navigator.pushNamed(context, '/home', arguments: HomeArguments(
              //   allBuildOrderList: argsBOList.allBuildOrderList,
              //   favBuildOrderList: argsBOList.favBuildOrderList,
              //   allBuildOrders: argsBOList.allBuildOrders,
              // ));
            },
            icon: Icon(Icons.edit_location),
            label: Text('${allBuildOrderList[index]}'),
          );
        },
      ),
    );
  }
}
