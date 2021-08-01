import 'package:flutter/material.dart';
import 'package:flutter2/data/all_orders.dart';

class Build_order_list_delete extends StatefulWidget {
  const Build_order_list_delete({Key? key}) : super(key: key);

  @override
  _Build_order_list_deleteState createState() => _Build_order_list_deleteState();
}

class _Build_order_list_deleteState extends State<Build_order_list_delete> {
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
        itemCount: favBuildOrderList.length,
        itemBuilder: (context, index) {
          return TextButton.icon(
            onPressed: () {
              favBuildOrderList.remove(
                  '${favBuildOrderList[index]}');
              Navigator.pushNamed(context, '/home', arguments: favBuildOrderList);
            },
            icon: Icon(Icons.edit_location),
            label: Text('${favBuildOrderList[index]}'),
          );
        },
      ),
    );
  }
}
