import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runner/main.dart';


//sharedpref!.getString("id") != null
class midelWare extends GetMiddleware {
  @override
  // ignore: body_might_complete_normally_nullable
  RouteSettings? redirect(String? route) {
    if (sharedpref!.getString('id') !=null) {
      return const  RouteSettings(name: "/stop_watch");
    }
  }
}
