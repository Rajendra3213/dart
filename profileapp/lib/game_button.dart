import 'dart:ui';
import 'package:flutter/material.dart';

class GameButton {
  // ignore: prefer_typing_uninitialized_variables
  final id;
  late String text;
  late Color bg;
  late bool enabled;
  GameButton({this.id, this.text = "", this.bg = Colors.lightGreen,this.enabled = true});
}
