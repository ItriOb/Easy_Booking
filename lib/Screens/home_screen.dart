import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_booking/constants.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';
  HomeScreen({this.city,this.country});
  final city;
  final country;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final checkinController = TextEditingController();
  final checkoutController = TextEditingController();
  String checkIn;
  String checkOut;
  int nAdults = 1;
  int nChildren = 0;

  Future<DateTime> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    return selectedDate;
  }
  @override
  void initState() {
    // TODO: implement initState
    print(widget.city);
    print(widget.country);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SizedBox(
            height: 75,
            width: 75,
            child: IconButton(
              icon: Image.asset(
                'assets/icons/vertical-yellow-title.png',
              ),
              onPressed: () {},
            ),
          )),
      backgroundColor: Colors.white,
      body: Column(
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
                      fontFamily: 'Open Sans',
                      color: Color(0xffebcb9b)),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter city name ',
                            hintStyle: TextStyle(
                              color: Color(0xffebcb9b),
                            ),
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
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xffebcb9b),
                                  ),
                                  onPressed: () async {
                                    checkIn = DateFormat('yyyy-MM-dd')
                                        .format(await _selectDate(context));
                                    checkinController.text = checkIn;
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
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xffebcb9b),
                                  ),
                                  onPressed: () async {
                                    checkOut = DateFormat('yyyy-MM-dd')
                                        .format(await _selectDate(context));
                                    checkoutController.text = checkOut;
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  Text(
                                    'Adults',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffebcb9b),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                            if (nAdults >= 1 && nAdults < 20)
                                              nAdults++;
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                children: [
                                  Text(
                                    'Children',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffebcb9b),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.remove,
                                          color: Color(0xffebcb9b),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (nChildren > 0) nChildren--;
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
                                            if (nChildren >= 0 && nChildren < 6)
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
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () {},
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Recommended',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card(
                            child: Column(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Image.network(
                                      'https://media.istockphoto.com/photos/happy-hotel-clerks-are-welcoming-professional-at-counter-picture-id1164435677?k=6&m=1164435677&s=612x612&w=0&h=nNBor-4YWIt1i9LRFVfzeXmA0U02owMy_PGkNN9W0gA=',
                                      height: 200,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        'Hamid',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Card(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  alignment: Alignment.bottomLeft,
                                  children: [
                                    Image.network(
                                      'https://media.istockphoto.com/photos/happy-hotel-clerks-are-welcoming-professional-at-counter-picture-id1164435677?k=6&m=1164435677&s=612x612&w=0&h=nNBor-4YWIt1i9LRFVfzeXmA0U02owMy_PGkNN9W0gA=',
                                      height: 200,
                                      fit: BoxFit.fitWidth,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        'Hamid',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
