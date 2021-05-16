import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rentapp/helper/constants.dart';
import 'package:rentapp/widgets/Occupationpage.dart';
import 'package:rentapp/widgets/anothercont.dart';
import 'package:rentapp/widgets/calender.dart';
import 'package:rentapp/widgets/contact.dart';
import 'package:rentapp/widgets/emailtext.dart';
import 'package:rentapp/widgets/first_name.dart';
import 'package:rentapp/widgets/last_name.dart';
import 'package:rentapp/widgets/officeaddress.dart';
import 'package:rentapp/widgets/rentpaid.dart';
import 'package:rentapp/widgets/uploadaadhar.dart';
import 'package:rentapp/widgets/uploadagreement.dart';
import 'package:rentapp/widgets/uploadprofile.dart';
import 'package:rentapp/widgets/work.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController FirstNameTextEditingController =
      new TextEditingController();
  TextEditingController LastNameTextEditingController =
      new TextEditingController();
  TextEditingController OccupationTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //THIS size PROVIDES US THE TOTAL HEIGHT AND WIDTH OF OUR SCREEN
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: size.height * 0.18,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
            ),
            // to give margin I have to take another container with same height and color in which this whole column is used
            child: Container(
              height: size.height * 0.20,
              color: Colors.black,
              margin: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Padding(padding: const EdgeInsets.only(top: 5.0),
                  // ),
                  Text(
                    "",
                    style: TextStyle(
                        fontSize: size.height * 0.0, color: kPrimaryLightColor),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),
                  Text(
                    "Add An Agreement",
                    style: TextStyle(
                        fontSize: size.height * 0.025,
                        color: kPrimaryLightColor),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),
                  Text(
                    "An Agreement is the document of the person who is living and paying the rent to live In.",
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: size.height * 0.015,
                        color: kPrimaryLightColor),
                    textAlign: TextAlign.left,
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
                   SizedBox(
                     height: size.height * 0.1,
                     child: HeadingWidget(
                       text: 'Upload Your Agreement',
                       icon: Icons.arrow_downward,
                     ),
                   ),
                    Center(
                      child: UploadFile(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    //first name
                    Center(
                      child: NamePage(),
                    ),
                    //last name
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Center(
                      child: LastNamePage(),
                    ),
                    // occupation
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Center(
                      child: OccupationPage(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Center(
                      child: CalenderPage(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Center(
                      child: RentPage(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    SizedBox(
                     height: size.height * 0.1,
                     child: HeadingWidget(
                       text: 'Upload Your Profile',
                       icon: Icons.arrow_downward,
                     ),
                   ),
                    Center(
                      child: UploadProfilePage(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    SizedBox(
                     height: size.height * 0.1,
                     child: HeadingWidget(
                       text: 'Upload Your Aadhar Card',
                       icon: Icons.arrow_downward,
                     ),
                   ),
                    Center(
                      child: UploadAadhar(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    SizedBox(
                     height: size.height * 0.1,
                     child: HeadingWidget(
                       text: 'About',
                       icon: Icons.arrow_downward,
                     ),
                   ),
                    Center(
                      child: EmailText(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Center(
                      child: ContactPage(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Center(
                      child: AnotherContactPage(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Center(
                      child: WorkingPage(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                    Center(
                      child: OfficeAddressPage(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class HeadingWidget extends StatelessWidget {

  final String text;
  final IconData icon;


  const HeadingWidget({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 22, color: kDarktColor),
          ),
          SizedBox(width: 14),
          Icon(icon, size: 20),
        ],
      );
}