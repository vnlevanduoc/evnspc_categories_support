import 'package:evnspc_categories_support/module/dang_nhap/dang_nhap_page.dart';
import 'package:evnspc_categories_support/module/trang_chu/trang_chu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      builder: (BuildContext context, Widget child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      title: 'EVNSPC CATEGORIES SUPPORT',
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        fontFamily: 'ProductSans',
        //splashColor: Colors.blueAccent, //hiệu ứng splash trong material
      ),
      initialRoute: '/trang_chu',
      routes: <String, WidgetBuilder>{
        '/trang_chu': (context) => TrangChuPage(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('vi'), // VietNam
      ],
    );
  }
}
