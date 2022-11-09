import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infilate/main_screen.dart';
import 'package:infilate/mainpage.dart';
import 'package:pinput/pinput.dart';

import '../create_profile/create_profile_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPVerificationWidget extends StatefulWidget {
  const OTPVerificationWidget({
    Key? key,
    required this.phoneNumber,
    this.dialCode,
  }) : super(key: key);

  final String phoneNumber;
  final String? dialCode;

  @override
  _OTPVerificationWidgetState createState() => _OTPVerificationWidgetState();
}

class _OTPVerificationWidgetState extends State<OTPVerificationWidget> {
  String verifyCode = "";
  String otpCode = "";

  Future signInWithPhoneNumber() async {
    print(widget.dialCode);
    print(widget.phoneNumber);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '${widget.dialCode}${widget.phoneNumber}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential).then(
          (value) async {
            final DocumentSnapshot? userDoc = await FirebaseFirestore.instance
                .collection("publisher_database")
                .doc(value.user!.uid)
                .get();
            print("userrrrrrrrrr::::${value.user!.uid}");
            print(userDoc!.id);
            if (!userDoc.exists) {
              print("---------------------------User doesnt exists");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => CreateProfileWidget(
                            number: widget.phoneNumber,
                          )));
            } else {
              print("---------------------------User exists");
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => MainScreen()));
            }
          },
        );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
        Fluttertoast.showToast(msg: e.code);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          verifyCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  void initState() {
    super.initState();
    signInWithPhoneNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(0, -1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
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
            child: Text(
              FFLocalizations.of(context).getText(
                'tefq31ax' /* Verification */,
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
            padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 10),
            child: Pinput(
              defaultPinTheme: PinTheme(
                width: 50,
                height: 50,
                textStyle: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(30, 60, 87, 1),
                    fontWeight: FontWeight.w600),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xFFE7E7E7),
                  ),
                ),
              ),
              length: 6,
              // validator: (s) {
              //   return (s ?? "").isNotEmpty ? null : 'Pin is necessary';
              // },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onChanged: (value) {
                setState(() {
                  otpCode = value;
                });
              },
            ),
            // Container(
            //   width: MediaQuery.of(context).size.width * 0.9,
            //   height: 90,
            //   child: custom_widgets.OTPTextField(
            //     width: MediaQuery.of(context).size.width * 0.9,
            //     height: 90,
            //   ),
            // ),
          ),
          Text(
            FFLocalizations.of(context).getText(
              'ti4sbxuk' /* Enter 6 digit code we sent */,
            ),
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'to  ${widget.dialCode}${widget.phoneNumber} ',
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
              Text(
                FFLocalizations.of(context).getText(
                  '8hjv6a0d' /*  Resend Code */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Manrope',
                      color: Color(0xFF0044EB),
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 30, 24, 0),
            child: FFButtonWidget(
              onPressed: () async {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (ctx) => CreateProfileWidget(),
                //   ),
                // );
                if (otpCode.isEmpty) {
                  Fluttertoast.showToast(msg: "Enter valid OTP");
                } else {
                  await FirebaseAuth.instance
                      .signInWithCredential(
                    PhoneAuthProvider.credential(
                        verificationId: verifyCode, smsCode: otpCode),
                  )
                      .then((value) async {
                    // print("otpppppppppppppp verifyakaln");
                    // print(value.user);
                    // print(value.user!.uid);
                    print(FirebaseAuth.instance.currentUser!.uid);
                    final DocumentSnapshot? userDoc = await FirebaseFirestore
                        .instance
                        .collection("publisher_database")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .get();
                    print('userDoc: $userDoc');
                    if (userDoc!.exists == false) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => CreateProfileWidget(
                                    number: widget.phoneNumber,
                                  )));
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => MainScreen()));
                    }
                    // if (value.user != null) {
                    //   // if(value.user.uid.)
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (ctx) => CreateProfileWidget(
                    //                 number: widget.phoneNumber,
                    //               )));
                    // } else {
                    //   print('user null');
                    // }
                  }).onError((error, stackTrace) {
                    Fluttertoast.showToast(msg: error.toString());

                    if (kDebugMode) {
                      print(error.toString());
                      // if(error.toString())
                    }
                  });
                }
              },
              text: FFLocalizations.of(context).getText(
                '8uoqj9vm' /* Verify */,
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
    );
  }
}
