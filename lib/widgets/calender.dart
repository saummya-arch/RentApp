import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rentapp/helper/constants.dart';


class CalenderPage extends StatefulWidget {
  @override
  _CalenderPageState createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {


  DateTime fromselectedDate = DateTime.now();
  DateTime toselectedDate = DateTime.now();

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd ');


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //THIS size PROVIDES US THE TOTAL HEIGHT AND WIDTH OF OUR SCREEN
    return Container(
      height: size.height * 0.32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        height: size.height * 0.28,
        color: kGreyColor,
        margin: const EdgeInsets.all(20.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text("Date", style: TextStyle(color: kDarktColor, fontSize: size.height * 0.035, fontWeight: FontWeight.bold),textAlign: TextAlign.left,
            ),
            SizedBox(
              height: size.height *0.04,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //1 row
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text("From", style: TextStyle(color: kDarktColor, fontSize: size.height * 0.022),textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        SizedBox(
                          height: size.height * 0.080,
                          width: size.width * 0.38,
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                focusColor: kPrimaryColor,
                                onPressed: () async {
                                  final fromselectedDate = await _selectDateTime(context);
                                  if (fromselectedDate == null)
                                  return;

                                  print(fromselectedDate);

                                  setState(() {
                                  this.fromselectedDate = DateTime(
                                  fromselectedDate.year,
                                  fromselectedDate.month,
                                  fromselectedDate.day,
                                  );
                                });
                                },  //onpressed of From calender button
                                ),
                              border: OutlineInputBorder(
                                borderSide:  BorderSide(color: kDarktColor, width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText: dateFormat.format(fromselectedDate),
                               hintStyle: TextStyle(fontSize: size.height * 0.025), 
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(    //2 row
                    child: Column(
                      children: <Widget>[
                        Text("To", style: TextStyle(color: kDarktColor, fontSize: size.height * 0.022),textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        SizedBox(
                          height: size.height * 0.080,
                          width: size.width * 0.38,
                          child: TextFormField(
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.calendar_today_outlined),
                                focusColor: kPrimaryColor,
                                onPressed: () async {
                                  final toselectedDate = await _selectDateTime(context);
                                  if (toselectedDate == null)
                                  return;

                                  print(toselectedDate);

                                  setState(() {
                                  this.toselectedDate = DateTime(
                                  toselectedDate.year,
                                  toselectedDate.month,
                                  toselectedDate.day,
                                  );
                                });
                                },  //onpressed of From calender button
                                ),
                              border: OutlineInputBorder(
                                borderSide:  BorderSide(color: kDarktColor, width: 2.0),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              hintText: dateFormat.format(toselectedDate),
                               hintStyle: TextStyle(fontSize: size.height * 0.025), 
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



Future<DateTime> _selectDateTime(BuildContext context) => showDatePicker(
        context: context,
        initialDate: DateTime.now().add(Duration(seconds: 1)),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
);