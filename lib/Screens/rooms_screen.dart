import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_booking/Services/hotel.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_booking/Screens/personal_infos_screen.dart';

class RoomsScreen extends StatefulWidget {
  RoomsScreen({this.hotelId,this.localCity,this.from,this.to,this.nights,this.nAdults,this.nChildren});

  static const id = 'rooms_screen';
  final hotelId;
  final localCity;
  final from;
  final to;
  final nights;
  final nAdults;
  final nChildren;

  @override
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
   var totalPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xffebcb9b),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'Rooms Available',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder(
                future: Hotel.getHotelRooms(widget.hotelId,widget.from,widget.to),
                builder: (context, projectSnap) {
                  if (projectSnap.connectionState == ConnectionState.none) {
                    //print('project snapshot data is: ${projectSnap.data}');
                    return Container();
                  } else if (!projectSnap.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: projectSnap.data.length,
                    itemBuilder: (BuildContext context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              //totalPrice = ((((int.parse(widget.nAdults)+int.parse(widget.nChildren))/int.parse(projectSnap.data[index]['guestnumber'])).ceil())*int.parse(projectSnap.data[index]['price']))*widget.nights;
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return PersonalInfosScreen(
                                  hotelData: projectSnap.data[index],
                                  localCity: widget.localCity,
                                  from: widget.from,
                                  to: widget.to,
                                  nights: widget.nights,
                                  roomId: projectSnap.data[index]['id'],
                                  roomPrice: projectSnap.data[index]['price'],
                                  nbGuests: projectSnap.data[index]['guestnumber'],
                                  totalprice: totalPrice,
                                  nAdults: widget.nAdults,
                                  nChildren: widget.nChildren,
                                );
                              }));
                            },
                            child: Container(
                              height: 134,
                              child: Card(
                                elevation: 2,
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Material(
                                            child: Image.network(
                                              projectSnap.data[index]
                                                  ['drive_image'],
                                              height: 100,
                                              fit: BoxFit.cover,
                                              width: 200,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                projectSnap.data[index]['name'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.bed,
                                                    color: Colors.black,
                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 17,
                                                  ),
                                                  Text(
                                                    'Room fits ${projectSnap.data[index]['guestnumber']} guest(s)',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            'Montserrat'),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Price : ${projectSnap.data[index]['price']}',
                                                style: TextStyle(
                                                    fontFamily: 'Montserrat'),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
