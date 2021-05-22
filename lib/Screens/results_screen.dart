import 'package:easy_booking/Components/reusable_card2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_booking/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_booking/Services/hotel.dart';



class ResultsScreen extends StatefulWidget {
  static const id = 'results_screen';
  ResultsScreen({this.city,this.from,this.to,this.hotelDetail,this.localCity,this.nights,this.nAdults,this.nChildren});
  final city;
  final from;
  final to;
  final localCity;
  final hotelDetail;
  final nights;
  final nAdults;
  final nChildren;
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
        child: Column(
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
            Expanded(
              child: FutureBuilder(
                  future:Hotel.getHotelWithRoomsInCity(widget.city,widget.from,widget.to),
                  builder: (context, projectSnap) {
                    if (projectSnap.connectionState ==
                        ConnectionState.none) {
                      //print('project snapshot data is: ${projectSnap.data}');
                      return Container();
                    } else if (!projectSnap.hasData) {
                      return Center(
                          child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: projectSnap.data.length,
                      itemBuilder: (BuildContext context, index) {
                        return ReusableCard2(
                          hotelName: projectSnap.data[index]['name'],
                          hotelRating: double.parse(projectSnap.data[index]['stars'].toString()),
                          hotelLocation: projectSnap.data[index]['city']['ville'],
                          hotelPrice: projectSnap.data[index]['main_price'],
                          hotelImage: projectSnap.data[index]['drive_image'],
                          hotelDetail: projectSnap.data[index],
                          localCity: widget.localCity,
                          from: widget.from,
                          to: widget.to,
                          nights: widget.nights,
                          nAdults: widget.nAdults,
                          nChildren: widget.nChildren,
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

