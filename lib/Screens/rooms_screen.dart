import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_booking/Services/hotel.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_booking/Screens/personal_infos_screen.dart';

class RoomsScreen extends StatefulWidget {
  RoomsScreen({this.hotelId});

  static const id = 'rooms_screen';
  final hotelId;

  @override
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
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
                future: Hotel.getHotelRooms(widget.hotelId),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return PersonalInfosScreen(
                                  hotelData: projectSnap.data[index],
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
                                                'Room title',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontFamily: 'Montserrat'),
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
