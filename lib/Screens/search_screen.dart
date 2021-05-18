import 'package:flutter/material.dart';
import 'package:easy_booking/constants.dart';
import 'package:easy_booking/Services/hotel.dart';
import 'package:easy_booking/Screens/home_screen.dart';

class SearchScreen extends StatefulWidget {
  static const id = 'search_screen';
  SearchScreen({this.isCity});
  final String isCity;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String city;

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
            child: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/icons/vertical-yellow-title.png',
              ),
            ),
          )),
      body: Column(
        children: [
          TextField(
            onChanged: (String val) {
              setState(() {
                city = val;
              });
            },
            decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter city name ',
                hintStyle: TextStyle(
                    color: Color(0xffebcb9b),
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xffebcb9b),
                )),
          ),
          Expanded(
            child: FutureBuilder(
                future: Hotel.getAllCities(city),
                builder: (context, projectSnap) {
                  if (projectSnap.connectionState == ConnectionState.none) {
                    //print('project snapshot data is: ${projectSnap.data}');
                    return Container();
                  } else if (!projectSnap.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: projectSnap.data.length,
                    itemBuilder: (BuildContext context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return HomeScreen(
                                  searchCity: projectSnap.data[index]['ville'],
                                  isCity: widget.isCity,
                                );
                              },
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                projectSnap.data[index]['ville'],
                                style: TextStyle(
                                  fontFamily: 'Montserrat'
                                ),
                              ),
                            ),
                          ],
                        ),
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
