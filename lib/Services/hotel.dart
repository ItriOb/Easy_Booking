import 'package:easy_booking/Services/networking.dart';
import 'package:easy_booking/Services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

const apiURL = 'http://10.0.2.2:8000/api';

class Hotel {
  static Future<dynamic> getHotelInCity(String city) async{
    Networking networkHelper = Networking(url:'$apiURL/hotels2?city=$city');
    var hotelInCityData = await networkHelper.getData();
    return hotelInCityData;
  }
  static Future<dynamic> getHotelWithRoomsInCity(String city,String from, String to) async{
    Networking networkHelper = Networking(url:'$apiURL/hotels?from=$from&to=$to&city=$city');
    var hotelInCityData = await networkHelper.getData();
    print(hotelInCityData);
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

  static Future<dynamic> getHotelRooms(int hotelId,String from,String to) async{
    Networking networkHelper = Networking(url:'$apiURL/room?from=$from&to=$to&id=$hotelId');
    var allCities = await networkHelper.getData();
    return allCities;
  }

  static Future<dynamic> createReservationGuest(String firstName, String lastName, String email, String phoneNumber) async{
    final response = await http.post('$apiURL/addReservationGuest', body: {
      'first_name': firstName,
      'last_name': lastName,
      'email' : email,
      'phone' : phoneNumber,
    });
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  static Future<dynamic> createBooking(dynamic guestId, dynamic from, dynamic to,dynamic totalPrice,dynamic nAdults, dynamic nChildren) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$apiURL/addBooking'));
    request.body = json.encode({
      "guest_id": guestId,
      "from": from,
      "to": to,
      "totalprice": totalPrice,
      "nAdults": nAdults,
      "nChildren": nChildren
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 200) {
      return json.decode(await response.stream.bytesToString());

    }
    else {
      print(response.reasonPhrase);
    }


  }

  static Future<dynamic> createPivot(dynamic bookingId, dynamic roomId) async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$apiURL/addPivot'));
    request.body = json.encode({
      "bookingid": bookingId,
      "roomid": roomId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return json.decode(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }
}