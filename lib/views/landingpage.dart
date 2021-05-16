import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentapp/helper/constants.dart';
import 'package:rentapp/views/home.dart';
import 'package:rentapp/views/upload.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<Widget> _children = [
    HomePage(),
    UploadPage(),
  ];
  int selectedIndex = 0;

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Do you want to exit."),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("No"),
          ),
          FlatButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //THIS size PROVIDES US THE TOTAL HEIGHT AND WIDTH OF OUR SCREEN
    return Scaffold(
      // body: Center(
      //   child: WillPopScope(
      //     onWillPop: _onBackPressed,
      //     child: RaisedButton(
      //       onPressed: () => {
      //         Navigator.pushReplacement(
      //       context, MaterialPageRoute(builder: (context) => LoginPage()))
      //       },
      //       child: Text("Logout"),
      //     ),
      //   ),
      // ),

      bottomNavigationBar: FFNavigationBar(
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
          ),
          FFNavigationBarItem(
            iconData: Icons.add,
            label: 'Add',
          ),
          FFNavigationBarItem(
            iconData: Icons.assignment_outlined,
            label: 'Agreements',
          ),
        ],
        theme: FFNavigationBarTheme(
          barBackgroundColor: kPrimaryLightColor,
          selectedItemBorderColor: Colors.yellow,
          selectedItemBackgroundColor: kPrimaryColor,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
        ),
      ),
      body: _children[selectedIndex], // new
    );
  }
}
