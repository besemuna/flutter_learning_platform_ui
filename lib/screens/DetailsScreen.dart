import 'package:flutter/material.dart';
import 'package:flutter_learning_platform_ui/models/CourseModel.dart';

class DetailsScreen extends StatefulWidget {
  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  Widget _buildCourseList(index) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 24, right: 24, top: 10),
      padding: EdgeInsets.all(7),
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Color(0xffB1ABAB).withOpacity(.15),
              blurRadius: 15,
              spreadRadius: 2),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(courses[index].picture), fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topRight,
                    child: Image(
                      image: courseContent[index].favourite
                          ? AssetImage("assets/icon_favorite.png")
                          : AssetImage("assets/icon.png"),
                    ),
                  ),
                  Text(
                    "${courseContent[index].video} Videos",
                    style: TextStyle(
                        color: Color(0xff646E85),
                        fontSize: 8,
                        fontFamily: 'Montserrat'),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    courseContent[index].title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
                  ),
                  SizedBox(
                    height: 23,
                  ),
                  Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: Color(0xffEBEEF4),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Stack(
                      children: <Widget>[
                        FractionallySizedBox(
                          widthFactor: courseContent[index].progress,
                          heightFactor: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xffFF7F2D),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 1,
                          heightFactor: 1,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xffF5F4EF),
              image: DecorationImage(
                  image: AssetImage("assets/big.png"), fit: BoxFit.contain),
            ),
            height: 300,
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 56, left: 24),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.keyboard_backspace),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                  child: Text(
                    "UX Design Courses list",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xff022334),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: courses.length,
                      itemBuilder: (BuildContext context, int index) =>
                          _buildCourseList(index)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
