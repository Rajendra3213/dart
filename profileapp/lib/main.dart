import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " profile app",
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(0, 193, 29, 48),
            title: const Text('My profile app'),
          ),
          body: Column(
            children: [
              const SizedBox(height: 15),
              Center(
                child: Image.network(
                  "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80",
                  height: 300,
                  width: 300,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                "Rajendra Acharya",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              const Text(
                "Diktel,Khotang",
                style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 97, 100, 103),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 7),
              const Text(
                "rajendraacharya@gmail.com",
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 97, 100, 103),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 300),
              const Text(
                "Developed by rajendra acharya",
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 97, 100, 103),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height:7),
              const Text(
                "powered by apple company",
                style: TextStyle(
                    fontSize: 8,
                    color: Color.fromARGB(255, 97, 100, 103),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ))));
}

class Network {}
