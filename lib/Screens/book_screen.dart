import 'package:flutter/material.dart';

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
      child: DraggableScrollableSheet(maxChildSize: 0.8,minChildSize: 0.4,
          builder: (context,controller){
            return Container(
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child:ListView.builder(
                itemCount: 1,
                controller: controller,
                itemBuilder: (BuildContext context,index){
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
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),

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
