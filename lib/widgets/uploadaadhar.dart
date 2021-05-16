import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadAadhar extends StatefulWidget {
  @override
  _UploadAadharState createState() => _UploadAadharState();
}

class _UploadAadharState extends State<UploadAadhar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //THIS size PROVIDES US THE TOTAL HEIGHT AND WIDTH OF OUR SCREEN
    return Container(
      height: size.height * 0.6,
      margin: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.green,
          width: 2.0,
        ),
      ),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              "assets/icons/upload.svg",
              height: size.height * 0.15,
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          ButtonWidget(
            text: 'Select File',
            icon: Icons.attach_file,
            onClicked: () {
              //selectFile
            },
          ),
          SizedBox(height: size.height * 0.04),
          Text(
            'fileName',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: size.height * 0.08),
          ButtonWidget(
              text: 'Upload File',
              icon: Icons.cloud_upload_outlined,
              onClicked: () {
                //uploadFile,
              }),
        ],
      ),
    );
  }
}





class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    this.icon,
    this.text,
    this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(29, 194, 95, 1),
          minimumSize: Size.fromHeight(50),
        ),
        child: buildContent(),
        onPressed: onClicked,
      );

  Widget buildContent() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ],
      );
}