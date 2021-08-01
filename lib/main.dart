import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/classes/build_order.dart';
import 'package:flutter2/pages/build_order_list_delete.dart';

import 'package:flutter2/pages/home.dart';
import 'package:flutter2/pages/build_order_action.dart';
import 'package:flutter2/pages/loading.dart';
import 'package:flutter2/pages/build_order_list.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/build_order_action': (context) => Build_order_action(),
    '/build_order_list': (context) => BuildOrderList(),
    '/build_order_list_delete': (context) => Build_order_list_delete(),
  },
));

