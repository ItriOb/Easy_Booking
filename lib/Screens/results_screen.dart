import 'package:easy_booking/Components/reusable_card2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_booking/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ResultsScreen extends StatefulWidget {
  static const id = 'results_screen';
  ResultsScreen({this.city});
  final city;
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xffebcb9b),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SizedBox(
            height: 75,
            width: 75,
            child: Image.asset(
              'assets/icons/vertical-yellow-title.png',
            ),
          )),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, top: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 35,
                    color: Color(0xffebcb9b),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.city,
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 20,
            ),
            ReusableCard2(city: widget.city,hotelImage: 'https://images.unsplash.com/photo-1596541223130-5d31a73fb6c6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80',hotelRating: 3,hotelName: 'Afoulki',price: '420',),
            ReusableCard2(city: widget.city,hotelImage: 'https://images.unsplash.com/photo-1568084680786-a84f91d1153c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80',hotelRating: 3,hotelName: 'Afoulki',price: '420',),

          ],
        ),
      ),
    );
  }
}

