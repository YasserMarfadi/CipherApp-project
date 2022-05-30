// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../constt.dart';
import '/screen/cipher_affine_screen.dart';
import '/screen/cipher_caesar_screen.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:provider/provider.dart';

class CipherHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'سيفرآب',
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.lens_blur_outlined,
            //Icons.vpn_key_outlined,
            size: 35,
          ),
          onPressed: () =>
              _launchInBrowser('https://ysrapps.github.io/cipherApp/'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),

            Container(
              child: Image.asset(
                'assets/images/logo1.png',
                fit: BoxFit.cover,
              ),
              height: 150,
              margin: EdgeInsets.symmetric(horizontal: 70),
            ),

            SizedBox(height: 45),

            BtnGoWidget(
              title: 'شفـرة قيـصـــــر',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CipherCaesar(),
                    ));
              },
            ),
            //
            SizedBox(height: 25),
            //
            BtnGoWidget(
              title: 'شفــرة أفييـنـــي',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CipherAffine(),
                    ));
              },
            ),
            SizedBox(height: 25),
            Spacer(),
            TextButton(
              onPressed: () {
                _launchInBrowser(
                    'http://wa.me/967779573071/?text=مرحبا..%20ياسر');
              },
              child: Column(
                children: [
                  Container(
                    //margin: EdgeInsets.only(bottom: 50),
                    //height: 50,
                    child: Text('تطــويــــر'),
                  ),
                  Image.asset(
                    'assets/images/ysr.png',
                    fit: BoxFit.cover,
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }
}

class BtnGoWidget extends StatelessWidget {
  String title;
  VoidCallback onPressed;
  BtnGoWidget({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        //,
        title,
        style: buildTextStyle(),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: kTextColor,
        ),
      ),
    );
  }
}

TextStyle buildTextStyle() {
  return TextStyle(
    color: kTextColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 3,
  );
}
