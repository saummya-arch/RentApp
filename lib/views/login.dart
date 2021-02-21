import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentapp/views/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              right: 0,
              child: Image.asset("assets/images/login_bottom.png"),
              width: size.width * 0.35,
            ),
            Positioned(
              top: 120.0,
              left: 40.0,
              child: //Text("MAKE AN AGREEMENT" , style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold)),
              Container(
                child: Column(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/login.svg", height: size.height * 0.33,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 320.0,
              left: 45.0,
              right: 50.0,
                child: SingleChildScrollView(
                    child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                      prefixIcon: Icon(
                      Icons.person,
                      size: 20.0,
                      color: kPrimaryColor,
                      ),
                      hintText: "Email/Contact No",
                    ),
                  ),
                ),
            ),

             

            //for password
            Positioned(
              bottom: 245.0,
              left: 45.0,
              right: 50.0,
                child: SingleChildScrollView(
                    child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        ),
                      prefixIcon: Icon(
                      Icons.lock,
                      size: 20.0,
                      color: kPrimaryColor,
                      ),
                      hintText: "Password",
                      suffixIcon: Icon(Icons.visibility,
                      size: 20.0,
                      color: kPrimaryColor, 
                      ),
                    ),
                  ),
                ),
            ),
            Positioned(
              bottom: 175.0,
              left: 45.0,
              right: 50.0,
                child: SizedBox(
                  height: size.height * 0.062,
                  width: size.width * 0.68,
                  child: RaisedButton(
                  onPressed: (){
            //         Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => LoginPage()),
            // );
                  },
                  color: kPrimaryColor,
                  child: Row(
                    children: <Widget>[
                      Padding(padding: const EdgeInsets.only(left: 100.0),),
                      Text("Login" , style: TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
                    ]
                  ),
                ),
              ),
            ),
          ], 
        ),
      ),
    );
  }
}



//EELLLEEEVATION