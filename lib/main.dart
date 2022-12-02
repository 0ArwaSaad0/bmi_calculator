import 'package:bmi_calculator/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (c) => HomePage(),
      },
      theme: ThemeData(
        //scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          subtitle1: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),

        ),
      ),
    );
  }
}
