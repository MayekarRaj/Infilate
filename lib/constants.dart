import 'package:flutter/material.dart';

const Color light = Color(0xFF8EB9FB);

const Color title = Color(0xFF182B50);
const Color lightText = Color(0xFFCAF7FD);

const Color icon = Color(0xFF052744);

const Color white = Colors.white;

const backblack = ImageIcon(
  AssetImage("assets/images/back.png"),
  color: Colors.black,
);

const backwhite = ImageIcon(
  AssetImage("assets/images/back.png"),
  color: white,
  size: 18,
);

class Constants {
  // static final Constants _instance = Constants._internal();

  // factory Constants() {
  //   return _instance;
  // }

  // Constants._internal() {
  //   initializePersistedState();
  // }

  String? docId;
}
