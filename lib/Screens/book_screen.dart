import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Book extends StatefulWidget {
  static const id = 'book_screen';

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: DraggableScrollableSheet(
        maxChildSize: 0.5,
        minChildSize: 0.3,
        builder: (context, controller) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: ListView.builder(
              itemCount: 1,
              controller: controller,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 7,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Color(0xffebcb9b),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        Container(
                          height: 50,
                          width: 300,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.only(left: 50,right: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.moneyBillWave,
                                    color: Color(0xffebcb9b),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Pay In Hotel',
                                    style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 15,color: Color(0xffebcb9b)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: 300,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50,right: 10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    FontAwesomeIcons.paypal,
                                    color: Color(0xffebcb9b),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Pay With Paypal',
                                    style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold,fontSize: 15,color:Color(0xffebcb9b) ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
