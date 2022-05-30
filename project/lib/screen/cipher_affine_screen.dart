// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:share/share.dart';
import '/actions/provider_help.dart';
import '../constt.dart';
import 'package:provider/provider.dart';

class CipherAffine extends StatelessWidget {
  //String? plaintext, ciphertext;
  final formKey = GlobalKey<FormState>();
  TextStyle txtStyle = TextStyle(color: kTextColor); //Theme.of(context);
  late String usertext;
  late int m, k;
  @override
  Widget build(BuildContext context) {
    final cipherPro = Provider.of<CipherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('شفرة أفييني'),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 13),
                buildInputKeys(),
                SizedBox(height: 20),
                TextFormField(
                  validator:
                      RequiredValidator(errorText: 'خطأ: هذا الحقل مطلوب'),
                  maxLines: 7,
                  keyboardType: TextInputType.multiline,
                  style: txtStyle,
                  decoration: InputDecoration(
                    labelText: "نص التشفير أو نص فك التشفير",
                    border: OutlineInputBorder(),
                    labelStyle: txtStyle,
                  ),
                  onChanged: (_usertext) {
                    usertext = _usertext.toString();
                  },
                  //decoration: InputDecoration.collapsed(
                  //  hintText: "hintText hintText hintText"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: Text("تشفير"),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              cipherPro.runEncipherTowKey(m, k, usertext);
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: kEncipherColor,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          child: Text("فك التشفير"),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              cipherPro.runDecipherTowKey(m, k, usertext);
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: kDecipherColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  maxLines: 9,
                  style: txtStyle,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: "النتيجة",
                    labelStyle: txtStyle,
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  controller: cipherPro.resultController,
                ),
                SizedBox(height: 30),
                Row(children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text("مشــاركة"),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Share.share(
                              cipherPro.resultController.text.toString());
                        }
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: kDecipherColor,
                      ),
                    ),
                  ),
                ]),
                Text('الخوارزمية تدعم العربية ولغات أخرى')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildInputKeys() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            validator: RequiredValidator(errorText: 'خطأ: هذا الحقل مطلوب'),
            style: txtStyle,
            autofocus: true,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              labelText: "الرمز الأول",
              hintText: '291 أرقام فقط',
              labelStyle: txtStyle,
              //fillColor: kTextColor,
              //hoverColor: kTextColor,
            ),
            keyboardType: TextInputType.number,
            maxLength: 7,
            onChanged: (newKey) {
              k = int.parse(newKey);
              //print('------------------------$k');
            },
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            validator: RequiredValidator(errorText: 'خطأ: هذا الحقل مطلوب'),
            style: txtStyle,
            cursorColor: Colors.red,
            decoration: InputDecoration(
              labelText: "الرمز الثاني",
              hintText: '18 أرقام فقط',
              labelStyle: txtStyle,
            ),
            keyboardType: TextInputType.number,
            maxLength: 3,
            onChanged: (newM) {
              m = int.parse(newM);
              //print('------------------------$m');
            },
          ),
        ),
      ],
    );
  }
}

/**
 *  TextField(
            style: txtStyle,
            decoration: InputDecoration(
              labelText: "الرمز الثاني",
              labelStyle: txtStyle,
            ),
            keyboardType: TextInputType.number,
            maxLength: 3,
            onChanged: (newM) {
              m = int.parse(newM);
              //print('------------------------$m');
            },
          ),
 */
