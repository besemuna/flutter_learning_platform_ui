import 'package:flutter/material.dart';
import 'package:flutter_learning_platform_ui/screens/DetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;
  final _tabs = ["New", "Trendy", "Best rated"];

  Widget _buildTab(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 30),
        child: Column(
          children: <Widget>[
            Text(
              _tabs[index],
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _currentIndex == index
                      ? Color(0xff022334)
                      : Color(0xff9AA5C7)),
            ),
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                  color: index == _currentIndex
                      ? Color(0xffFF7F2D)
                      : Color(0xfffff),
                  borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCourse({type, name, number, color, picture}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => DetailsScreen()));
      },
      child: Container(
        width: 170,
        height: type == 1 ? 250 : 280,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: AssetImage(
              picture,
            ),
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0xff022334),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${number} Courses",
              style: TextStyle(
                  color: Color(0xff646E85),
                  fontSize: 8,
                  fontFamily: 'Montserrat'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 48),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: Icon(
                    Icons.dehaze,
                    color: Color(0xff000000),
                  ),
                ),
                Image(
                  image: AssetImage(
                    "assets/avatar.png",
                  ),
                  width: 38,
                )
              ],
            ),
          ),
          SizedBox(
            height: 53,
          ),
          Text(
            "Hey Ramjan,",
            style: TextStyle(
                color: Color(0xff022334),
                fontSize: 33,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat'),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Learn new Skills today!",
            style: TextStyle(
                fontSize: 24,
                color: Color(0xff022334),
                fontFamily: 'Montserrat'),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Color(0xffF3F4F9))),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16)),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Container(
            height: 22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return _buildTab(index);
              },
            ),
          ),
          SizedBox(
            height: 31,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    _buildCourse(
                        type: 1,
                        name: "UX Design",
                        number: 35,
                        color: Color(0xffF5F4EF),
                        picture: "assets/one.png"),
                    _buildCourse(
                        type: 1,
                        name: "Illustrator",
                        number: 35,
                        color: Color(0xffFFFCEC),
                        picture: "assets/three.png")
                  ],
                ),
                Column(
                  children: <Widget>[
                    _buildCourse(
                        type: 2,
                        name: "Photoshop",
                        number: 35,
                        color: Color(0xffD4EBFB),
                        picture: "assets/two.png"),
                    _buildCourse(
                        type: 2,
                        name: "Development",
                        number: 35,
                        color: Color(0xffFFF0E1),
                        picture: "assets/four.png")
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
