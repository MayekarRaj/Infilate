// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/internationalization.dart';

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.antiAlias,
//       alignment: new FractionalOffset(.5, 1.0),
//       children: [
//         Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height * 0.1,
//           decoration: BoxDecoration(
//             color: Colors.white,
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(12, 14, 12, 8),
//                     child: Icon(
//                       Icons.home_outlined,
//                       color: Color(0xFFD9D9D9),
//                       size: 25,
//                     ),
//                   ),
//                   Text(
//                     FFLocalizations.of(context).getText(
//                       'blqfzjxe' /* Home */,
//                     ),
//                     style: FlutterFlowTheme.of(context).bodyText1.override(
//                           fontFamily: 'Manrope',
//                           color: Color(0xFF99A9BF),
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(12, 14, 12, 8),
//                     child: Icon(
//                       Icons.flag_rounded,
//                       color: Color(0xFFD9D9D9),
//                       size: 25,
//                     ),
//                   ),
//                   Text(
//                     FFLocalizations.of(context).getText(
//                       'o6q525sl' /* Lead */,
//                     ),
//                     style: FlutterFlowTheme.of(context).bodyText1.override(
//                           fontFamily: 'Manrope',
//                           color: Color(0xFF99A9BF),
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                 ],
//               ),
//               Align(
//                 alignment: AlignmentDirectional(0, 0),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.12,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                   ),
//                 ),
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(12, 14, 12, 8),
//                     child: Icon(
//                       Icons.star_border,
//                       color: Color(0xFFD9D9D9),
//                       size: 25,
//                     ),
//                   ),
//                   Text(
//                     FFLocalizations.of(context).getText(
//                       'jrl3fhfs' /* Refferal */,
//                     ),
//                     style: FlutterFlowTheme.of(context).bodyText1.override(
//                           fontFamily: 'Manrope',
//                           color: Color(0xFF99A9BF),
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                 ],
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(12, 14, 12, 9),
//                     child: FaIcon(
//                       FontAwesomeIcons.graduationCap,
//                       color: Color(0xFFD9D9D9),
//                       size: 20,
//                     ),
//                   ),
//                   Text(
//                     FFLocalizations.of(context).getText(
//                       'yoe8pgmq' /* Traning */,
//                     ),
//                     style: FlutterFlowTheme.of(context).bodyText1.override(
//                           fontFamily: 'Manrope',
//                           color: Color(0xFF99A9BF),
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         // new FloatingActionButton(onPressed: () {}, ),
//         // new FloatingActionButtonLocation().
//         Padding(
//           padding: EdgeInsets.only(bottom: 20),
//           child: Container(
//             height: 80,
//             width: 80,
//             child: new FloatingActionButton(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               onPressed: () {},
//               child: Image.asset(
//                 'assets/images/Group_176.png',
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
// // Container(
// //             width: 80,
// //             height: 80,
// //             decoration: BoxDecoration(
// //               color: Colors.transparent,
// //               image: DecorationImage(
// //                 fit: BoxFit.cover,
// //                 image: Image.asset(
// //                   'assets/images/Group_176.png',
// //                 ).image,
// //               ),
// //               shape: BoxShape.circle,
// //             ),
// //           ),