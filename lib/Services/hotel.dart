import 'package:easy_booking/Services/networking.dart';
import 'package:easy_booking/Services/location.dart';
import 'package:flutter/material.dart';

const apiURL = 'http://10.0.2.2:8000/api';

class Hotel {
  static Future<dynamic> getHotelInCity(String city) async{
    Networking networkHelper = Networking(url:'$apiURL/hotels2?city=$city');
    var hotelInCityData = await networkHelper.getData();
    print(hotelInCityData);
    return hotelInCityData;
  }
  static Future<dynamic> getHotelWithRoomsInCity(String city,String from, String to) async{
    Networking networkHelper = Networking(url:'$apiURL/hotels?from=28-05-2021&to=28-05-2021&city=$city');
    var hotelInCityData = await networkHelper.getData();
    return hotelInCityData;
  }
  static Future<dynamic>  getAllHotels() async{
    Networking networkHelper = Networking(url:'$apiURL/allhotels');
    var hotelInCityData = await networkHelper.getData();
    return hotelInCityData;
  }
  static Future<dynamic> getAllCities(String city) async{
    Networking networkHelper = Networking(url:'$apiURL/cities?city=$city');
    var allCities = await networkHelper.getData();
    return allCities;
  }

  static Future<dynamic> getHotelRooms(int hotelId) async{
    print("asdasdasdasd");
    Networking networkHelper = Networking(url:'$apiURL/room?from=10-10-2021&to=10-12-2021&id=$hotelId');
    var allCities = await networkHelper.getData();
    return allCities;
  }
}