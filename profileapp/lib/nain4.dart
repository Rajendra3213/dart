// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const NewPage());
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "My home Page",
      home: NewHomePage(),
    );
  }
}

class NewHomePage extends StatefulWidget {
  NewHomePage({Key? key}) : super(key: key);
 
  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
   String? username;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page",
            style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Center(
              child: Container(
                padding: const EdgeInsets.only(bottom: 20),
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.network(
                    'https://assets.stickpng.com/thumbs/5a1886f38d421802430d2d00.png'),
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          // ignore: prefer_const_constructors
          Padding(
            //padding: const EdgeInsets.only(top:50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            // ignore: prefer_const_constructors
            // ignore: prefer_const_constructors
            child: TextField(
              onChanged:(val){
                setState(() {
                  username = val;
                });
              },
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter Valid Email',
              ),
            ),
          ),
          // ignore: prefer_const_constructors
          Padding(
            //padding: const EdgeInsets.only(top:50),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            // ignore: prefer_const_constructors
            // ignore: prefer_const_constructors
            child: TextField(
              onChanged:(val){
                setState(() {
                  username = val;
                });
              },
              obscureText: true,
              // ignore: prefer_const_constructors
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter Strong Password',
              ),
            ),
          ),
          FlatButton(
              onPressed: () {
                if(username=='Rajendra' && password == "1234"){
                  Navigator.push(context, MaterialPageRoute(builder:(MyApp(username)));
                }
              },
              // ignore: prefer_const_constructors
              child: Text(
                'Forget Password',
                style: const TextStyle(fontSize: 12, color: Colors.blue),
              )),
          Container(
              height: 80,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const HomePage()));
                },
                child: const Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    )),
              )),
          const SizedBox(
            height: 80,
          ),
          const Text('New User? Create Account'),
        ]),
      ),
    );
  }
}
