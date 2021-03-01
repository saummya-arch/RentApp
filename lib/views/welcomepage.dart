import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentapp/helper/constants.dart';
import 'package:rentapp/views/login.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) { 
  Size size = MediaQuery.of(context).size; 
    //THIS size PROVIDES US THE TOTAL HEIGHT AND WIDTH OF OUR SCREEN
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
            children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/main_top.png"),
              width: size.width * 0.28,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png"),
              width: size.width * 0.18,
            ),
            Positioned(
              top: 180.0,
              left: 50.0,
              child: //Text("MAKE AN AGREEMENT" , style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold)),
              Container(
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/chat.svg", height: size.height * 0.38,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 180.0,
              left: 70.0,
              right: 70.0,
                child: SizedBox(
                  height: size.height * 0.062,
                  width: size.width * 0.68,
                  child: RaisedButton(
                  onPressed: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
            );
                  },
                  color: kPrimaryColor,
                  child: Row(
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(left: 37.0),),
                      Text("ADD AN AGREEMENT" , style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold)),
                    ]
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 7.0,
              left: 160.0,
              child: Text("Version: ^1.A.9.0" , style: TextStyle(color: Colors.black38, fontSize: 10.0, fontWeight: FontWeight.bold)),
            ),
          ], 
        ),
      ),
    );
  }
}