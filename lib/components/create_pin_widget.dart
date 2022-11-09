import 'dart:math';

import 'package:infilate/main_screen.dart';
import 'package:infilate/mainpage.dart';
import 'package:pinput/pinput.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_screen/login_screen_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePinWidget extends StatefulWidget {
  const CreatePinWidget({Key? key}) : super(key: key);

  @override
  _CreatePinWidgetState createState() => _CreatePinWidgetState();
}

class _CreatePinWidgetState extends State<CreatePinWidget> {
  TextEditingController? pinput;

  @override
  void initState() {
    super.initState();
    pinput = TextEditingController();
    // rng();
  }

  rng() {
    Random random = Random();

    int number = random.nextInt(10000);

    setState(() {
      pinput!.text = number.toString();
    });

    return number.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, -1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: 50,
                  height: MediaQuery.of(context).size.height * 0.01,
                  decoration: BoxDecoration(
                    color: Color(0xFFEE704A),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Container(
                width: 60.2,
                height: 60.2,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/smartphone_1.png',
                    ).image,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Text(
                FFLocalizations.of(context).getText(
                  'c59fihfd' /* Create Pin */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Chivo',
                      color: Color(0xFF0044EB),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
                child: Pinput(
                  defaultPinTheme: PinTheme(
                    width: 64,
                    height: 64,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Manrope',
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                    decoration: BoxDecoration(
                      color: Color(0xFFFDFDFD),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Color(0xFFE7E7E7),
                      ),
                    ),
                  ),
                  length: 4,
                  controller: pinput,
                )
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Container(
                //       width: 64,
                //       height: 64,
                //       decoration: BoxDecoration(
                //         color: Color(0xFFFDFDFD),
                //         borderRadius: BorderRadius.circular(4),
                //         border: Border.all(
                //           color: Color(0xFFE7E7E7),
                //         ),
                //       ),
                //       child: Padding(
                //         padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                //         child: Text(
                //           FFLocalizations.of(context).getText(
                //             'igb03sqe' /* 1 */,
                //           ),
                //           textAlign: TextAlign.center,
                //           style: FlutterFlowTheme.of(context).bodyText1.override(
                //                 fontFamily: 'Manrope',
                //                 fontSize: 19,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       width: 64,
                //       height: 64,
                //       decoration: BoxDecoration(
                //         color: Color(0xFFFDFDFD),
                //         borderRadius: BorderRadius.circular(4),
                //         border: Border.all(
                //           color: Color(0xFFE7E7E7),
                //         ),
                //       ),
                //       child: Padding(
                //         padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                //         child: Text(
                //           FFLocalizations.of(context).getText(
                //             'tc4m9cmq' /* 7 */,
                //           ),
                //           textAlign: TextAlign.center,
                //           style: FlutterFlowTheme.of(context).bodyText1.override(
                //                 fontFamily: 'Manrope',
                //                 fontSize: 19,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       width: 64,
                //       height: 64,
                //       decoration: BoxDecoration(
                //         color: Color(0xFFFDFDFD),
                //         borderRadius: BorderRadius.circular(4),
                //         border: Border.all(
                //           color: Color(0xFFE7E7E7),
                //         ),
                //       ),
                //       child: Padding(
                //         padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                //         child: Text(
                //           FFLocalizations.of(context).getText(
                //             'si90ox0p' /* 0 */,
                //           ),
                //           textAlign: TextAlign.center,
                //           style: FlutterFlowTheme.of(context).bodyText1.override(
                //                 fontFamily: 'Manrope',
                //                 fontSize: 19,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       width: 64,
                //       height: 64,
                //       decoration: BoxDecoration(
                //         color: Color(0xFFFDFDFD),
                //         borderRadius: BorderRadius.circular(4),
                //         border: Border.all(
                //           color: Color(0xFFE7E7E7),
                //         ),
                //       ),
                //       child: Padding(
                //         padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                //         child: Text(
                //           FFLocalizations.of(context).getText(
                //             '85lr8ivq' /* 3 */,
                //           ),
                //           textAlign: TextAlign.center,
                //           style: FlutterFlowTheme.of(context).bodyText1.override(
                //                 fontFamily: 'Manrope',
                //                 fontSize: 19,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                ),
            Text(
              FFLocalizations.of(context).getText(
                'slnu0kqo' /* Please Create your M-pin for y... */,
              ),
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: InkWell(
                onTap: () {
                  rng();
                },
                child: Text(
                  FFLocalizations.of(context).getText(
                    'sobxzug7' /* Auto Generate */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Manrope',
                        color: Color(0xFF3D9BFC),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 30, 16, 10),
              child: FFButtonWidget(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ),
                  );
                },
                text: FFLocalizations.of(context).getText(
                  '7zaqnuvu' /* Done */,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48,
                  color: Color(0xFF0044EB),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Manrope',
                        color: Colors.white,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
