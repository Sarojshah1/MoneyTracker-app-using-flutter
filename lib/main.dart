
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:managment/Screens/Login.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:managment/widgets/bottomnavigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/model/add_date.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
        builder: (context, child){
        return FutureBuilder<void>(
          future: checkLoginTime(context),
          builder: (context, snapshot) {
            // Handle the snapshot if needed
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: LoginScreen(),
            );},);
        }
    );
  }
  Future<void> checkLoginTime(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the last login time
    int lastLoginTimestamp = prefs.getInt('lastLoginTimestamp') ?? 0;

    // Calculate the time difference in seconds
    int currentTime = DateTime.now().toUtc().millisecondsSinceEpoch;
    int timeDifference = currentTime - lastLoginTimestamp;
    int twoDaysInSeconds = 2 * 24 * 60 * 60 * 1000; // 2 days in milliseconds
    double screenWidth = MediaQuery.of(context).size.width;
    // If more than 2 days have passed, show the login screen
    if (timeDifference > twoDaysInSeconds) {
      // You may want to navigate to the login screen
      // or replace the current screen with the login screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Bottom()),
      );
    }}
}
