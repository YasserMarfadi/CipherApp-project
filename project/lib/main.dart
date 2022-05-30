import 'package:flutter/material.dart';
import 'constt.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '/screen/cipher_home.dart';
import 'package:provider/provider.dart';

import 'actions/provider_help.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CipherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //textTheme: GoogleFonts.almaraiTextTheme(Theme.of(context).textTheme),
          primaryColor: kEncipherColor,
          backgroundColor: kBackgroundColor,
          scaffoldBackgroundColor: kBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: kEncipherColor,
          ),
        ),
        // حتى يدعم التطبيق اللغة العربية
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [Locale("ar", "AE")],
        title: "cipherApp",
        // home: CipherHome(),
        home: CipherHome(),
      ),
    );
  }
}
