import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentapp/helper/constants.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //THIS size PROVIDES US THE TOTAL HEIGHT AND WIDTH OF OUR SCREEN
    return Column(
        children: <Widget>[
          Container(
            height: size.height * 0.30,
            decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.0),
             bottomLeft: Radius.circular(20.0)
            ),
            ),
            // to give margin I have to take another container with same height and color in which this whole column is used
            child: Container(
              height: size.height * 0.30,
              color: kPrimaryColor,
              margin: const EdgeInsets.all(18.0),
              child: Column(
                children: <Widget>[
                  Text("RentApp", style: TextStyle(fontSize: size.height * 0.035, color: kPrimaryLightColor), textAlign: TextAlign.center,
                  ),
                  
                    Expanded(
                      child: Row(                  
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(Icons.menu, color: kPrimaryLightColor, size: size.height * 0.040,
                          ),
                          Column(
                            children: <Widget>[
                              Padding(padding: const EdgeInsets.only(top: 20.0),
                              ),
                              Container(
                                height: size.height * 0.060,
                                //padding: const EdgeInsets.only(top: 4.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: size.height * 0.030,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.greenAccent[100],
                                    radius: size.height * 0.027,
                                    child: CircleAvatar(
                                      child: SvgPicture.asset("assets/icons/man.svg", height: size.height * 0.045),
                                      // backgroundImage: NetworkImage(
                                      // ""), //NetworkImage
                                      radius: 100,
                                    ), //CircleAvatar
                                  ), //CircleAvatar
                                ),
                              ), //CircleAvatar
                              Padding(padding: const EdgeInsets.only(top: 4.0),
                              ),
                              Text("Hi, Sam" ,style:  TextStyle(color: kPrimaryLightColor, fontSize: size.height * 0.018),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  SizedBox(                     
                    height: size.height *0.01,
                  ),
                  Container(                             
                    height: size.height * 0.07,
                    child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: kDarktColor,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Search ...",
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Image.asset("assets/icons/no result.jpg", height: size.height * 0.38,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                    ),
                    Text("No Areements Yet", style:  TextStyle(color: kPrimaryColor, fontSize: size.height * 0.012),
                    ),
                    Text("Click + to add Agreement", style:  TextStyle(color: kPrimaryColor, fontSize: size.height * 0.012),
                    ),
                    Center(
                      child: Image.asset("assets/icons/no result.jpg", height: size.height * 0.38,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                    ),
                    Center(
                      child: Image.asset("assets/icons/no result.jpg", height: size.height * 0.38,
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
  }
}