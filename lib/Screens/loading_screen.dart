import 'package:flutter/material.dart';
import 'package:easy_booking/Services/location.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_booking/Screens/home_screen.dart';
import 'package:easy_booking/Services/city.dart';
import 'package:easy_booking/Services/hotel.dart';

class LoadingScreen extends StatefulWidget {
  static const id = 'loading_screen';
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    getHotelData();
  }
  void getHotelData() async {
    City city = City();
    var cityData = await city.getLocationCity();
    dynamic cityName = cityData['results'][0]['components']['city'];
    if (cityName == null){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen(
              isCity: cityName,
            );
          },
        ),
      );
    } else
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen(
                isCity: cityName,
              );
            },
          ),
        );
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/icons/vertical-yellow-title.png',
                height: 100,
                width: 100,
              ),
            ),
            SpinKitChasingDots(
              color: Color(0xffebcb9b),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}