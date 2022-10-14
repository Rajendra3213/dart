import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
       debugShowCheckedModeBanner:false,
        theme: ThemeData(primaryColor:const Color.fromARGB(255, 43, 26, 198)),
        home: HomePage(AutofillHints.username),
    );
    return materialApp;
  }
}
