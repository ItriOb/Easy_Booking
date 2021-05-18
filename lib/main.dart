import 'package:flutter/material.dart';
import 'package:easy_booking/Screens/home_screen.dart';
import 'package:easy_booking/Screens/loading_screen.dart';
import 'package:easy_booking/Screens/results_screen.dart';
import 'package:easy_booking/Screens/details_screen.dart';
import 'package:easy_booking/Screens/book_screen.dart';
import 'package:easy_booking/Screens/search_screen.dart';
import 'package:easy_booking/Screens/rooms_screen.dart';

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
        ResultsScreen.id:(context)=>ResultsScreen(),
        DetailsScreen.id:(context)=>DetailsScreen(),
        Book.id:(context)=>Book(),
        RoomsScreen.id:(context)=>RoomsScreen(),
        SearchScreen.id:(context)=>SearchScreen(),

      },
    );
  }
}

