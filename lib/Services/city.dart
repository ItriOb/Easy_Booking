import 'package:easy_booking/Services/networking.dart';
import 'package:easy_booking/Services/location.dart';
import 'package:flutter/material.dart';

const apiKey = 'efb5b73bb2664927abb43b61aa4292ae';
const openCageDataURL = 'https://api.opencagedata.com/geocode/v1/json';
class City {
  Future<dynamic> getLocationCity() async{
    Location location = Location();
    await location.getCurrentLocation();
    Networking networkHelper = Networking(url:'$openCageDataURL?q=${location.latitude}+${location.longitude}&key=$apiKey');
    var cityData = await networkHelper.getData();
    return cityData;
  }

}