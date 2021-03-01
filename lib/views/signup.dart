import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rentapp/helper/helperfunctions.dart';
import 'package:rentapp/services/auth.dart';
import 'package:rentapp/services/database.dart';
import 'package:rentapp/helper/constants.dart';
import 'package:rentapp/views/login.dart';
import 'package:rentapp/views/temp.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}


AuthMethods authMethods = new AuthMethods();


DatabaseMethods databaseMethods = new DatabaseMethods();

class _SignUpPageState extends State<SignUpPage> {


  final formKey = GlobalKey<FormState>();


  bool _showPassword = false;
  bool isLoading = false;


  TextEditingController usernameTextEditingController = new  TextEditingController();
  TextEditingController emaileTextEditingController = new  TextEditingController();
  TextEditingController passwordTextEditingController = new  TextEditingController();



  loadIng() {
    Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }




  

  afterValidation() {
    if (formKey.currentState.validate()) {

      Map<String, String> userInfoMap = {
        "username" : usernameTextEditingController.text,
        "email" : emaileTextEditingController.text
      };

      // to save details written in register formfields
      

      setState(() {
        isLoading = true;
      });


      authMethods.signUpWithEmailAndPassword(emaileTextEditingController.text, passwordTextEditingController.text).then((val) {


        databaseMethods.uploadUserInfo(userInfoMap);


        HelperFunctions.saveUserNameSharedPreference(usernameTextEditingController.text);
        HelperFunctions.saveUserEmailSharedPreference(emaileTextEditingController.text);
        HelperFunctions.saveUserLoggedInSharedPreference(true);


        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TemporaryPage())
        );
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //THIS size PROVIDES US THE TOTAL HEIGHT AND WIDTH OF OUR SCREEN
    return Scaffold(
      body: isLoading ? loadIng() : SingleChildScrollView(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 50.0,
                left: 170.0,
                child: Text(
                  "SIGN UP",
                  style: TextStyle(color: kPrimaryColor, fontSize: 20.0),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset("assets/images/signup_top.png"),
                width: size.width * 0.34,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                child: Image.asset("assets/images/main_bottom.png"),
                width: size.width * 0.2,
              ),
              Positioned(
                top: 85.0,
                left: 70.0,
                child: //Text("MAKE AN AGREEMENT" , style: TextStyle(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.bold)),
                    Container(
                  child: Column(
                    children: <Widget>[
                      SvgPicture.asset(
                        "assets/icons/signup.svg",
                        height: size.height * 0.31,
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Container(
                  child: Positioned(
                    top: 380.0,
                    left: 45.0,
                    right: 48.0,
                    child: Column(
                      children: <Widget>[
                        //for username

                        TextFormField(
                          validator: (val) {
                            return val.isEmpty || val.length < 4 ? "Please Provide Username" : null;
                          },
                          controller: usernameTextEditingController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              size: 20.0,
                              color: kPrimaryColor,
                            ),
                            hintText: "Username"
                          ),
                        ),
                        Padding(padding: const EdgeInsets.only(top: 18.0),
                        ),


                        //for email
                        TextFormField(
                          validator: (val) {
                            return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) && val.isNotEmpty ? null : "Enter correct email";
                          },
                          controller: emaileTextEditingController,
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
                bottom: 170.0,
                left: 45.0,
                right: 50.0,
                child: SizedBox(
                  height: size.height * 0.062,
                  width: size.width * 0.68,
                  child: RaisedButton(
                    onPressed: () {
                      
                      afterValidation();
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
                      Text("SIGNUP",
                        style: TextStyle(
                          color: Colors.white,
                        fontSize: 20.0,
                      fontWeight: FontWeight.bold)),
                    ]),
                  ),
                ),
              ),
              Positioned(
                bottom: 130.0,
                left: 90.0,
                child: Text(
                  "Already have an account ? ",
                  style: TextStyle(color: kPrimaryColor, fontSize: 15.0),
                ),
              ),
              Positioned(
                bottom: 130.0,
                right: 97.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                ),
              ),
              Positioned(
                bottom: 105.0,
                left: 55.0,
                child: Container(
                  width: size.width * 0.7,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Color(0xFFD9D9D9),
                          height: 3.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                      Text(
                        "OR",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      ),
                      Expanded(
                        child: Divider(
                          color: Color(0xFFD9D9D9),
                          height: 3.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 40.0,
                left: 100.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.5,
                          color: kPrimaryColor,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/facebook.svg",
                        height: 10.0,
                        width: 10.0,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2.5,
                          color: kPrimaryColor,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/google-plus.svg",
                        height: 10.0,
                        width: 10.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}