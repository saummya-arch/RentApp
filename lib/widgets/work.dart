import 'package:flutter/material.dart';
import 'package:rentapp/helper/constants.dart';


class WorkingPage extends StatefulWidget {
  @override
  _WorkingPageState createState() => _WorkingPageState();
}

class _WorkingPageState extends State<WorkingPage> {


  final formKey = GlobalKey<FormState>();
  TextEditingController WorkingTextEditingController =
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
        controller: WorkingTextEditingController,
        decoration: InputDecoration(
            border: OutlineInputBorder(
             borderSide:  BorderSide(color: kDarktColor, width: 2.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintText: "Where are you currrently working : (Place)"),
      ),
    );
  }
}