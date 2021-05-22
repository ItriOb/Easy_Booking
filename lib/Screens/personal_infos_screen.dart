import 'package:flutter/material.dart';
import 'package:easy_booking/constants.dart';
import 'package:easy_booking/Screens/book_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:core';

class PersonalInfosScreen extends StatefulWidget {
  PersonalInfosScreen({this.hotelData,this.localCity,this.from,this.to,this.nights,this.nAdults,this.nChildren,this.roomId,this.roomPrice,this.nbGuests,this.totalprice});

  static const id = 'personal_infos_screen';
  final hotelData;
  final localCity;
  final from;
  final to;
  final nights;
  final nAdults;
  final nChildren;
  final roomId;
  final roomPrice;
  final nbGuests;
  final totalprice;

  @override
  _PersonalInfosScreenState createState() => _PersonalInfosScreenState();
}

class _PersonalInfosScreenState extends State<PersonalInfosScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  bool isButtonEnabled = false;
  var totalPrice ;
  var nbRooms;

  bool isEmpty() {
    if (firstNameController.text == "" &&
        lastNameController.text == "" &&
        emailController.text == "" &&
        phoneNumberController.text == "") {
      setState(() {
        isButtonEnabled = false;
      });
    } else
      setState(() {
        isButtonEnabled = true;
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    totalPrice = ((((widget.nAdults+widget.nChildren)/widget.nbGuests).ceil())*int.parse(widget.roomPrice))*widget.nights;
    nbRooms =((widget.nAdults+widget.nChildren)/widget.nbGuests).ceil();
  // print('Adults : '+widget.nAdults.toString());
  // print('Children : '+int.parse(widget.nChildren).toString());
  // print('Guests : '+int.parse(widget.nbGuests).toString());
  // print('roomPrice : '+int.parse(widget.roomPrice).toString());
  // print('Nights : '+int.parse(widget.nights).toString());

  }

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Image.network(
                      widget.hotelData['hotel']['drive_image'],
                      height: 125,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.building,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                widget.hotelData['hotel']['name'],
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                widget.hotelData['hotel']['Address'],
                                style: TextStyle(fontFamily: 'Montserrat'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              FontAwesomeIcons.phone,
                              size: 15,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                widget.hotelData['hotel']['phone'],
                                style: TextStyle(fontFamily: 'Montserrat'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your details',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'First Name : ',
                            style: TextStyle(fontFamily: 'Montserrat'),
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: Text(
                            'Last Name : ',
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              onChanged: (val) {
                                isEmpty();
                              },
                              controller: firstNameController,
                              style: TextStyle(
                                color: Color(0xffebcb9b),
                              ),
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'First Name',
                                hintStyle: TextStyle(
                                  color: Color(0xffebcb9b),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: (val) {
                                isEmpty();
                              },
                              controller: lastNameController,
                              style: TextStyle(
                                color: Color(0xffebcb9b),
                              ),
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Last Name',
                                hintStyle: TextStyle(
                                  color: Color(0xffebcb9b),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email Address : ',
                        style: TextStyle(fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (val) {
                          isEmpty();
                        },
                        controller: emailController,
                        style: TextStyle(
                          color: Color(0xffebcb9b),
                        ),
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Email Address',
                          hintStyle: TextStyle(
                            color: Color(0xffebcb9b),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Phone Number : ',
                        style: TextStyle(fontFamily: 'Montserrat'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onChanged: (val) {
                          isEmpty();
                        },
                        controller: phoneNumberController,
                        style: TextStyle(
                          color: Color(0xffebcb9b),
                        ),
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            color: Color(0xffebcb9b),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF5F4F1),
                                border: Border.all(
                                  color: Colors.black45,
                                  width: 1,
                                )),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, left: 30.0, right: 30.0, bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order Summary',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    color: Colors.black,
                                    height: 1,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Night(s)',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        widget.nights.toString(),
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Room(s)',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                          nbRooms.toString(),
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                       '${totalPrice.toString()} \$ ' ,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ButtonTheme(
                            minWidth: 500,
                            height: 60,
                            child: RaisedButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Text(
                                'Check Out',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 20),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color(0xffebcb9b),
                              // onPressed: isButtonEnabled?() {
                              //   showModalBottomSheet(context: context,isScrollControlled: true,
                              //       backgroundColor: Colors.transparent, builder:(context)=> Book());
                              // }:null,
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => Book(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      email: emailController.text,
                                      phone: phoneNumberController.text,
                                      localCity: widget.localCity,
                                      from: widget.from,
                                      to: widget.to,
                                      nAdults: widget.nAdults,
                                      nChildren: widget.nChildren,
                                      totalPrice: totalPrice,
                                      roomId: widget.roomId,
                                    ));
                              },
                              elevation: 0,
                              highlightElevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
