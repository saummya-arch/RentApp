import 'package:flutter/material.dart';
import 'package:rentapp/helper/constants.dart';

class EmailText extends StatefulWidget {
  @override
  _EmailTextState createState() => _EmailTextState();
}

class _EmailTextState extends State<EmailText> {

  final formKey = GlobalKey<FormState>();
  TextEditingController EmailTextEditingController =
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
        controller: EmailTextEditingController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
             borderSide:  BorderSide(color: kDarktColor, width: 2.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Email"),
      ),
    );
  }
}