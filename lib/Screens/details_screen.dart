import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:easy_booking/Screens/book_screen.dart';
import 'package:local_hero/local_hero.dart';
import 'dart:ui';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({this.hotelImage});
  static const id = 'details_screen';
  final String hotelImage;
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> imageList = [
    'https://images.unsplash.com/photo-1576675784201-0e142b423952?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1568495248636-6432b97bd949?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80',
    'https://images.unsplash.com/photo-1576675784432-994941412b3d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1590490359854-dfba19688d70?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80',
  'https://images.unsplash.com/photo-1566195992011-5f6b21e539aa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1267&q=80',
  ];
  bool _showPreview= false;
  String _image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _image = imageList[0];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 350,
                child: Stack(
                  children: [
                    ClipRRect(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        child: Image.network(
                            widget.hotelImage,
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 70),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: IconButton(
                          alignment: Alignment.center,
                          color: Colors.black87,
                          icon: Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hotel Name',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                        RatingBar.builder(
                          initialRating: 4, //put the rating from api here
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                          ),
                          updateOnDrag: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          size: 20,
                          color: Color(0xffebcb9b),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Location',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum suscipit placerat nulla, eget tincidunt lorem scelerisque non. Quisque nunc sem, vestibulum et ex a, porttitor ullamcorper tortor. Morbi euismod augue quis condimentum euismod. Praesent vehicula in enim sit amet imperdiet. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed egestas eget mauris quis iaculis. ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Facilities',
                      style: TextStyle(
                          fontFamily: 'Montserrat', fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: imageList.length,
                        itemBuilder: (BuildContext context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onLongPress: () {
                                  setState(() {
                                    _showPreview = true;
                                    _image = imageList[index];
                                  });
                                },
                                onLongPressEnd: (details) {
                                  setState(() {
                                    _showPreview = false;
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius:BorderRadius.all(Radius.circular(20)),
                                  child: LocalHeroScope(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                    child: Image.network(
                                      imageList[index],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '\$ 750',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ButtonTheme(
                            minWidth: 200,
                            height: 60,
                            child: RaisedButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Text(
                                'Book now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 20),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color(0xffebcb9b),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => Book());
                              },
                              elevation: 0,
                              highlightElevation: 0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          if (_showPreview) ...[
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Container(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: LocalHeroScope(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Image.network(
                      _image,
                      height: 500,
                      width: 500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
