import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class services extends GetxService {
  SharedPreferences? sharedpref;
  Future<services> init() async {
    sharedpref = await SharedPreferences.getInstance();
    return this;
  }

}
