// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:infilate/main_screen.dart';

// import 'create_profile/create_profile_widget.dart';
// import 'mainpage.dart';

// class AuthVerifyPage extends StatefulWidget {
//   final String uid;
//   final String? number;
//   const AuthVerifyPage({Key? key, required this.uid, this.number})
//       : super(key: key);

//   @override
//   State<AuthVerifyPage> createState() => _AuthVerifyPageState();
// }

// class _AuthVerifyPageState extends State<AuthVerifyPage> {
//   Future checkUserInDatabase() async {
//     final DocumentSnapshot? userDoc = await FirebaseFirestore.instance
//         .collection("publisher_database")
//         .doc(widget.uid)
//         .get();

//     if (userDoc == null) {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (ctx) => CreateProfileWidget(
//                     number: widget.number,
//                   )));
//     } else {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (ctx) => MainScreen()));
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     checkUserInDatabase();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
