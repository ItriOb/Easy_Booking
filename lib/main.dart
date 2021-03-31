import 'package:flutter/material.dart';
import 'package:easy_booking/Screens/home_screen.dart';
import 'package:easy_booking/Screens/loading_screen.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Booking',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Color(0xFFebcb9b),
      //   accentColor: Color(0xFF000000),
      // ),
      home:LoadingScreen(),
      initialRoute: LoadingScreen.id,
      routes: {
        HomeScreen.id:(context)=>HomeScreen(),
        LoadingScreen.id:(context)=>LoadingScreen(),
      },
    );
  }
}

