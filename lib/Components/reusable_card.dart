import 'package:easy_booking/Screens/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_booking/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ReusableCard extends StatelessWidget {
  const ReusableCard({this.hotelRating,this.image});

  final double hotelRating;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 6,
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius : BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                child: Image.network(
                  'https://html.com/wp-content/uploads/very-large-flamingo.jpg',
                  height: 200,
                  fit: BoxFit.cover,
                  width: 600,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, top: 10, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hotel Name',
                          style: kTextDecoration,
                        ),
                        Text(
                          '\$ Price',
                          style: kTextDecoration,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.mapMarkerAlt,size: 20,),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Location'),
                          ],
                        ),
                        Text(
                          'per night',
                          style: TextStyle(
                              fontFamily: 'Montserrat'
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RatingBar.builder(
                      initialRating: hotelRating, //put the rating from api here
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 15,
                      itemPadding: EdgeInsets.symmetric(
                          horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        FontAwesomeIcons.solidStar,
                        color: Colors.amber,
                      ),
                      updateOnDrag: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: (){
          Navigator.pushNamed(context, DetailsScreen.id);
        },
      ),
    );
  }
}