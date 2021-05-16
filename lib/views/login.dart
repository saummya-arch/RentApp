import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentapp/helper/constants.dart';
import 'package:rentapp/helper/helperfunctions.dart';
import 'package:rentapp/services/auth.dart';
import 'package:rentapp/services/database.dart';
import 'package:rentapp/views/landingpage.dart';
import 'package:rentapp/views/signup.dart';
import 'package:rentapp/views/upload.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final formKey = GlobalKey<FormState>();


  AuthMethods authMethods = new AuthMethods();

  DatabaseMethods databaseMethods = new DatabaseMethods();


  bool _rememberMe = false;
  bool _showPassword = false;
  bool isLoading = false;


  TextEditingController emailTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();




  QuerySnapshot snapshotUserInfo;

  afterSignInValidation(){

    if(formKey.currentState.validate()){


      HelperFunctions.saveUserEmailSharedPreference(emailTextEditingController.text);

      databaseMethods.getUserByUserEmail(emailTextEditingController.text)
          .then((val){
              snapshotUserInfo = val;
              HelperFunctions.saveUserNameSharedPreference(snapshotUserInfo.documents[1].data["username"]);
             // print("${snapshotUserInfo.documents[0].data["name"]} this is my world");
          });



      setState(() {
        isLoading = true;
      });


      authMethods.signInWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text)
          .then((val){
             if(val!= null) {
                HelperFunctions.saveUserLoggedInSharedPreference(true);

             Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LandingPage()));
             }

          });      
      }

  }    





  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //THIS size PROVIDES US THE TOTAL HEIGHT AND WIDTH OF OUR SCREEN
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 70.0,
                left: 170.0,
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: kPrimaryColor, fontSize: 20.0),
                ),
              ),
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
                        "assets/icons/login.svg",
                        height: size.height * 0.33,
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Container(
                  child: Positioned(
                    top: 460.0,
                    left: 45.0,
                    right: 48.0,
                    child: Column(
                      children: <Widget>[


                        //for email
                        TextFormField(
                          validator: (val) {
                            return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) && val.isNotEmpty ? null : "Enter correct email";
                          },
                          controller: emailTextEditingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            prefixIcon: Icon(
                              Icons.mail,
                              size: 20.0,
                              color: kPrimaryColor,
                            ),
                            hintText: "Password"
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(top: 18.0),
                        ),


                        //for password
                        TextFormField(
                          validator: (val) {
                            return val.length > 6 ? null : "Please Provide aStrong Password";
                          },
                          controller: passwordTextEditingController,
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
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                _showPassword ? Icons.visibility : Icons.visibility_off,
                                size: 20.0,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                          obscureText: !_showPassword,
                        ),
                      ],
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
                    onPressed: () {
                      afterSignInValidation();
                      //         Navigator.push(
                      //         context,
                      //         MaterialPageRoute(builder: (context) => LoginPage()),
                      // );
                    },
                    color: kPrimaryColor,
                    child: Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                      ),
                      Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)),
                    ]),
                  ),
                ),
              ),
              Positioned(
                bottom: 130.0,
                left: 90.0,
                child: Text(
                  "Don't have an account ? ",
                  style: TextStyle(color: kPrimaryColor, fontSize: 15.0),
                ),
              ),
              Positioned(
                bottom: 130.0,
                right: 103.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}