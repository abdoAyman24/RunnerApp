import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runner/Midel_war/Auth_midelWar.dart';
import 'package:runner/Screen/Login_Screen.dart';
import 'package:runner/Screen/stop_watch.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? sharedpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      getPages: [
        GetPage(
          name: "/",
          page: () => const LoginScreen(),
          middlewares: [
            midelWare(),
          ],
        ),
        GetPage(name: "/stop_watch", page: () => StopWatch())
      ],
    );
  }
}
