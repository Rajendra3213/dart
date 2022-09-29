
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "To do app",
    home: TODOAPP(),
  ));
}

class TODOAPP extends StatefulWidget {
  const TODOAPP({Key? key}) : super(key: key);

  @override
  State<TODOAPP> createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  String value = '';
  var listToDO = [''];
  addToDo(String item) {
    setState(() {
      listToDO.add(item);
    });
  }

  removeToDo(String item) {
    setState(() {
      listToDO.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: const Text(
            "TO DO APP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                removeToDo(value);
              },
            ),
            const SizedBox(width: 50),
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                if (value == '') {
                  ErrorHint("Please enter the field");
                } else {
                  addToDo(value);
                }
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: listToDO.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(onChanged: (val) {
                        value = val;
                      }),
                    )
                  : ListTile(
                      leading: const Icon(Icons.access_alarm_rounded),
                      title: Text(listToDO[index],
                          style:
                              // ignore: prefer_const_constructors
                              TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          )));
            }));
  }
}
