import 'dart:ffi';

import 'package:easy_booking/Screens/results_screen.dart';
import 'package:easy_booking/Services/hotel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_booking/constants.dart';
import 'package:intl/intl.dart';
import 'package:easy_booking/Config/size_config.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_booking/Components/reusable_card.dart';
import 'package:easy_booking/Screens/search_screen.dart';
import 'package:sweetalert/sweetalert.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  HomeScreen({this.isCity,this.searchCity});
  final String isCity;
  final String searchCity;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final checkinController = TextEditingController();
  final checkoutController = TextEditingController();
  final cityController = TextEditingController();
  int nights;

  DateTime checkIn;
  DateTime checkOut;
  int nAdults = 1;
  int nChildren = 0;
  bool isButtonEnabled = false;
  double hotelRating = 4.5;

  bool isEmpty() {
    setState(() {
      isButtonEnabled=true;
    });
    return isButtonEnabled;
  }

  Future<DateTime> _selectDate(
      BuildContext context, DateTime selectedDate) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });

    }

    return selectedDate;
  }
  @override
  void initState() {
    // TODO: implement initState
    print(widget.isCity);
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SizedBox(
            height: 75,
            width: 75,
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/icons/vertical-yellow-title.png',
              ),
            ),
          )),
      backgroundColor: Colors.white,
      // floatingActionButton: IconButton(
      //   icon: Icon(Icons.add),
      //   onPressed: (){
      //     SweetAlert.show(context,
      //         title: "Just show a message",
      //         subtitle: "Sweet alert is pretty",
      //         style: SweetAlertStyle.success);
      //   },
      // ),
      body: ListView(
        children: [
          SizedBox(
            height: SizeConfig.blockSizeVertical * 87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        'Where do you want to stay ?',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          color: Color(0xffebcb9b),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextField(
                              readOnly: true,
                              onChanged: (value) {
                                isEmpty();
                              },
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>SearchScreen(isCity: widget.isCity,)),
                                );
                              },
                              controller: cityController,
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: widget.searchCity,
                                  hintStyle: TextStyle(
                                      color: Color(0xffebcb9b),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold),
                                  prefixIcon: Icon(
                                    Icons.location_on,
                                    color: Color(0xffebcb9b),
                                  )),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                      color: Color(0xffebcb9b),
                                    ),
                                    controller: checkinController,
                                    readOnly: true,
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: 'Check-in',
                                      hintStyle: TextStyle(
                                        color: Color(0xffebcb9b),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xffebcb9b),
                                        ),
                                        onPressed: () async {
                                          checkIn = await _selectDate(
                                              context, DateTime.now());
                                          setState(() {
                                            checkinController.text =
                                                DateFormat('dd-MM-yyyy')
                                                    .format(checkIn);
                                          });

                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(
                                      color: Color(0xffebcb9b),
                                    ),
                                    controller: checkoutController,
                                    readOnly: true,
                                    decoration: kTextFieldDecoration.copyWith(
                                      hintText: 'Check-out',
                                      hintStyle: TextStyle(
                                        color: Color(0xffebcb9b),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Color(0xffebcb9b),
                                        ),
                                        onPressed: () async {
                                            checkOut = await _selectDate(
                                                context, checkIn);
                                            setState(() {
                                              checkoutController.text = DateFormat('dd-MM-yyyy')
                                                  .format(checkOut);
                                            });
                                            
                                            nights = checkOut.difference(checkIn).inDays;
                                            print(nights);


                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xffebcb9b),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Adults',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffebcb9b),
                                              fontFamily: 'Montserrat'),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                color: Color(0xffebcb9b),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (nAdults > 1) nAdults--;
                                                });
                                              },
                                            ),
                                            Text(
                                              nAdults.toString(),
                                              style: TextStyle(
                                                color: Color(0xffebcb9b),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                color: Color(0xffebcb9b),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (nAdults >= 1 &&
                                                      nAdults < 20) nAdults++;
                                                });
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Color(0xffebcb9b),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Children',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffebcb9b),
                                              fontFamily: 'Montserrat'),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                color: Color(0xffebcb9b),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (nChildren > 0)
                                                    nChildren--;
                                                });
                                              },
                                            ),
                                            Text(
                                              nChildren.toString(),
                                              style: TextStyle(
                                                color: Color(0xffebcb9b),
                                              ),
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                color: Color(0xffebcb9b),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  if (nChildren >= 0 &&
                                                      nChildren < 6)
                                                    nChildren++;
                                                });
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              child: Text(
                                'Get it',
                              ),
                              style: TextButton.styleFrom(
                                primary: Color(0xffebcb9b),
                                backgroundColor: Colors.black
                              ),
                              onPressed: () {
                                print('Adults : $nAdults');
                                print('Children : $nChildren');
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return ResultsScreen(
                                          city: widget.searchCity,
                                          from: checkinController.text,
                                          to: checkoutController.text,
                                          localCity: widget.isCity,
                                          nights: nights,
                                          nChildren: nChildren,
                                          nAdults: nAdults,
                                        );
                                      }));
                                      print(nights);
                                    }
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    height: 300,
                    decoration: BoxDecoration(
                        color: Color(0xffebcb9b),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Recommended',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Montserrat'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 200,
                            child: FutureBuilder(
                                future: (widget.isCity == null)
                                    ? Hotel.getAllHotels()
                                    : Hotel.getHotelInCity(widget.isCity),
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
                                    scrollDirection: Axis.horizontal,
                                    itemCount: projectSnap.data.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return ReusableCard(
                                        hotelName: projectSnap.data[index]
                                            ['name'],
                                        hotelRating: double.parse(projectSnap
                                            .data[index]['stars']
                                            .toString()),
                                        hotelLocation: projectSnap.data[index]['city']
                                            ['ville'],
                                        hotelPrice: projectSnap.data[index]
                                            ['main_price'],
                                        hotelImage: projectSnap.data[index]
                                            ['drive_image'],
                                        hotelDetail: projectSnap.data[index],
                                        localCity: widget.isCity,
                                        nAdults: nAdults,
                                        nChildren: nChildren,
                                        from: checkinController.text,
                                        to: checkoutController.text,
                                        nights: nights,
                                      );
                                    },
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
