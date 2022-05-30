// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '/actions/provider_help.dart';
import '../constt.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

String? resaultext;

class CipherCaesar extends StatelessWidget {
  //String? plaintext, ciphertext;
  TextStyle txtStyle = TextStyle(color: kTextColor);
  //Theme.of(context);
  late String usertext;

  int k = 0;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cipherPro = Provider.of<CipherProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('شفرة قيصر'),
      ),
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.end,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 20,
                ),
                //InputKeyWidget(),

                buildInputKeys(),
                SizedBox(height: 20),
                TextFormField(
                  validator: RequiredValidator(errorText: 'خطأ: الحقل مطلوب'),
                  maxLines: 7,
                  keyboardType: TextInputType.multiline,
                  style: txtStyle,
                  decoration: InputDecoration(
                    labelText: "نص التشفير أو نص فك التشفير",
                    border: OutlineInputBorder(),
                    labelStyle: txtStyle,
                  ),
                  onSaved: (_usertext) {
                    usertext = _usertext!;
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
                              cipherPro.runEncipher(k, usertext);
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
                              cipherPro.runDecipher(k, usertext);
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
                  //validator: RequiredValidator(errorText: 'خطأ: الحقل مطلوب'),
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

  Container buildInputKeys() {
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        validator: RequiredValidator(errorText: 'خطأ: الحقل مطلوب'),
        style: txtStyle,
        autofocus: true,
        cursorColor: Colors.red,
        decoration: InputDecoration(
          labelText: " رمز التشفير",
          hintText: '52641 أرقام فقط',
          labelStyle: txtStyle,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number,
        maxLength: 8,
        onSaved: (newKey) {
          k = int.parse(newKey!);
          //print('------------------------$k');
        },
      ),
    );
  }
}
