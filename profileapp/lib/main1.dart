import 'package:flutter/material.dart';

void main() {
  runApp(ScoreApp());
}

class ScoreApp extends StatelessWidget {
  const ScoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My score app",
      home: const Scorehome(),
    );
  }
}

class Scorehome extends StatefulWidget {
  const Scorehome({Key? key}) : super(key: key);

  @override
  State<Scorehome> createState() => _ScorehomeState();
}

class _ScorehomeState extends State<Scorehome> {
  int number = 0;
  void increaseNumber() {
    setState(() {
      number++;
    });
  }

  void decreaseNumber() {
    setState(() {
      number--;
    });
  }

  void resetNumber() {
    setState(() {
      number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Score Changer"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.restore_outlined),
          onPressed: resetNumber,
        ),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 25,
              // ignore: prefer_const_constructors
            ),
            Center(
                child: const Text("Score is",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(number.toString(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 150,
                      fontWeight: FontWeight.bold,
                    ))),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  color: Colors.blue,
                  child: Text("Increase",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: increaseNumber,
                ),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  color: Colors.red,
                  child: Text("Decrease",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  onPressed: decreaseNumber,
                ),
              ],
            ),
          ],
        ));
  }
}
