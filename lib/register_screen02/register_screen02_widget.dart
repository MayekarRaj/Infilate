import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infilate/components/create_pin_widget.dart';
import 'package:infilate/visting_card/visiting_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen02Widget extends StatefulWidget {
  const RegisterScreen02Widget({Key? key}) : super(key: key);

  @override
  _RegisterScreen02WidgetState createState() => _RegisterScreen02WidgetState();
}

class _RegisterScreen02WidgetState extends State<RegisterScreen02Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? uid;
  String? name;
  String? number;
  String? email;
  String? edu;

  Future getData() async {
    final data = await FirebaseFirestore.instance
        .collection("publisher_database")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (data.exists) {
      setState(() {
        name = data["username"] ?? "Name";
        number = data["phone"] ?? "Number";
        email = data["email"] ?? "Email";
        edu = data["education"] ?? "Pass";
      });
    }
  }

  Future setUnicode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("unicode", uid!);
  }

  rng() {
    Random random = Random();

    int number = random.nextInt(10000);

    setState(() {
      uid = number.toString();
    });

    return number.toString();
  }

  @override
  void initState() {
    super.initState();
    rng();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFE7E7E7),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 150, 0, 30),
                  child: Container(
                    width: 80,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/Done!.png',
                        ).image,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Container(
                    width: 290,
                    height: 169,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Color(0xFF3D9BFC),
                        )),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/images/ppl.png",
                                height: 98,
                                width: 98,
                              ),
                              Text(
                                'INFI$uid',
                                style: GoogleFonts.manrope(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0XFF01213A),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name ?? "Name",
                                // textAlign: TextAlign.left,
                                style: GoogleFonts.chivo(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0XFF01213A),
                                ),
                              ),
                              Text(
                                number ?? "Number",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                email ?? "Email",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                edu ?? "Education",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                              Text(
                                "IND | Mumbai",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'w72b7lsv' /* Your Unique ID */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Manrope',
                          color: Color(0xFF8F8F8F),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Container(
                    width: 206,
                    height: 53,
                    decoration: BoxDecoration(
                      color: Color(0xFFFDFDFD),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: Color(0x86868686),
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'INFI$uid',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Manrope',
                                      color: Color(0xFF3D9BFC),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => VistingCard(
                                    uid: uid!,
                                    name: name!,
                                    email: email!,
                                    number: number!,
                                    education: edu!,
                                  )));
                    },
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'qe5tigr0' /* Save */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Manrope',
                            color: Color(0xFF3D9BFC),
                            fontSize: 14,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '60vihgnq' /* Share your visitng card with y... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Manrope',
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    '8e42nme5' /* Click on Create pin to Generat... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Manrope',
                        color: Color(0xFF858585),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      saveUid("INFI$uid");
                      setUnicode();
                      await showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        builder: (_) => CreatePinWidget(),
                      );
                    },
                    text: "Create M-PIN",
                    options: FFButtonOptions(
                      width: 328,
                      height: 48,
                      color: Color(0xFF2561FC),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Manrope',
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                      borderSide: BorderSide(
                        color: Color(0xFF2561FC),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '658om19t' /* Share now */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future saveUid(String uid) async {
    final firestore = FirebaseFirestore.instance;

    firestore
        .collection("publisher_database")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({"unicode": uid});
  }
}
