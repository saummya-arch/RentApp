import 'package:flutter/material.dart';
import 'package:rentapp/helper/constants.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final formKey = GlobalKey<FormState>();
  TextEditingController ContactTextEditingController =
      new TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //THIS size PROVIDES US THE TOTAL HEIGHT AND WIDTH OF OUR SCREEN
    return SizedBox(
      height: size.height * 0.095,
      width: size.width * 0.85,
      child: TextFormField(
        validator: (val) {
          return RegExp(r"^([A-Z][a-z]*)([\\s\\\'-][A-Z][a-z]*)*")
                      .hasMatch(val) &&
                  val.isNotEmpty
              ? null
              : "Enter Your Name";
        },
        controller: ContactTextEditingController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
             borderSide:  BorderSide(color: kDarktColor, width: 2.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Contact Number"),
      ),
    );
  }
}