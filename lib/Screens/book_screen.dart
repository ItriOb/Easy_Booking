import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_booking/Services/hotel.dart';
import 'package:easy_booking/Screens/home_screen.dart';
import 'package:sweetalert/sweetalert.dart';

class Book extends StatefulWidget {
  Book(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.from,
      this.to,
      this.state,
      this.localCity,
      this.nAdults,
      this.nChildren,this.roomId,this.totalPrice});

  static const id = 'book_screen';

  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String from;

  final String to;

  final String state;
  final localCity;
  final nAdults;
  final nChildren;
  final roomId;
  final totalPrice ;

  @override
  _BookState createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: DraggableScrollableSheet(
        maxChildSize: 0.17,
        minChildSize: 0.15,
        initialChildSize: 0.17,
        builder: (context, controller) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
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
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: 300,
                          child: InkWell(
                            onTap: () async {
                              var reservationGuestId =
                                  await Hotel.createReservationGuest(
                                      widget.firstName,
                                      widget.lastName,
                                      widget.email,
                                      widget.phone);
                              print(reservationGuestId);
                              int reservationguest = reservationGuestId['id'];
                              print(reservationguest.toString());
                              var bookingId = await Hotel.createBooking(
                                  reservationguest,
                                 widget.from,
                                  widget.to,
                                  widget.totalPrice,
                                  widget.nAdults,
                                  widget.nChildren,
                                 );
                              print(widget.roomId);
                              print(bookingId["id"]);
                             var pivotResult = await Hotel.createPivot(bookingId["id"], widget.roomId);

                              if(pivotResult['result']=='Successful'){
                                print("SUCCESS");
                                SweetAlert.show(context,
                                    title: "Just show a message",
                                    subtitle: "Sweet alert is pretty",
                                    style: SweetAlertStyle.success,
                                    onPress: (bool pressed){
                                     if(pressed){
                                      Future.delayed(Duration(milliseconds: 300), (){
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(builder: (context) {
                                              return HomeScreen(
                                                isCity: widget.localCity,
                                              );
                                            }));
                                      });
                                     }
                                      return true;
                                    }
                                );
                              }



                            },
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, right: 10),
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
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(0xffebcb9b)),
                                    ),
                                  ],
                                ),
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
