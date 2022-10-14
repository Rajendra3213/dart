// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:profileapp/custom_dialog.dart';

import 'game_button.dart';

class HomePage extends StatefulWidget {
  String? username;
  HomePage(this.username, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<GameButton> buttonList;
  @override
  void initState() {
    super.initState();

    buttonList = doInit();
  }

  List<GameButton> doInit() {
    var gameButton = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButton;
  }

  var player1 = [];
  var player2 = [];
  var activePlayer = 1;
  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.blueAccent;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = '0';
        gb.bg = Colors.deepOrangeAccent;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => CustomDialog("Game is tied", "reset", resetGame));
        } else {
          activePlayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    Timer(Duration(seconds: 5), () {
      var emptyCells = [];
      var list = List.generate(9, (i) => i + 1);
      for (var cellId in list) {
        if (!(player1.contains(cellId) || player2.contains(cellId))) {
          emptyCells.add(cellId);
        }
      }
      var r = Random();
      var randIndex = r.nextInt(emptyCells.length - 1);
      var cellId = emptyCells[randIndex];
      int i = buttonList.indexWhere((p) => p.id == cellId);
      playGame(buttonList[i]);
    });
  }

  int checkWinner() {
    var winner = -1;
    if ((player1.contains(1) && player1.contains(2) && player1.contains(3)) ||
        (player1.contains(1) && player1.contains(4) && player1.contains(7)) ||
        (player1.contains(1) && player1.contains(5) && player1.contains(9)) ||
        (player1.contains(4) && player1.contains(5) && player1.contains(6)) ||
        (player1.contains(7) && player1.contains(8) && player1.contains(9)) ||
        (player1.contains(2) && player1.contains(5) && player1.contains(8)) ||
        (player1.contains(3) && player1.contains(6) && player1.contains(9)) ||
        (player1.contains(3) && player1.contains(5) && player1.contains(7))) {
      winner = 1;
    }
    if ((player2.contains(1) && player2.contains(2) && player2.contains(3)) ||
        (player2.contains(1) && player2.contains(4) && player2.contains(7)) ||
        (player2.contains(1) && player2.contains(5) && player2.contains(9)) ||
        (player2.contains(4) && player2.contains(5) && player2.contains(6)) ||
        (player2.contains(2) && player2.contains(5) && player2.contains(8)) ||
        (player2.contains(3) && player2.contains(6) && player2.contains(9)) ||
        (player2.contains(7) && player2.contains(8) && player2.contains(9)) ||
        (player2.contains(3) && player2.contains(5) && player2.contains(7))) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                "Player 1 won", "Press the reset button", resetGame));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                "Player 2 won", "Press the reset button", resetGame));
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonList = doInit();
      player1 = [];
      player2 = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    int itemCount;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
        backgroundColor: Colors.black26,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: SizedBox(height: 20, child: Text("developed By Rajendra")),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              itemCount: buttonList.length,
              // ignore: prefer_const_constructors
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 9,
                mainAxisSpacing: 9,
              ),
              itemBuilder: (context, i) =>
                  // ignore: prefer_const_constructors
                  SizedBox(
                width: 100,
                height: 100,
                child: RaisedButton(
                  onPressed: buttonList[i].enabled
                      ? () => playGame(buttonList[i])
                      : null,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(buttonList[i].text,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20)),
                  color: buttonList[i].bg,
                  disabledColor: buttonList[i].bg,
                ),
              ),
            ),
          ),
          RaisedButton(
              padding: const EdgeInsets.all(10.0),
              // ignore: prefer_const_constructors
              child: Text(
                "Reset",
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              color: Colors.black,
              onPressed: resetGame),
        ],
      ),
    );
  }
}
