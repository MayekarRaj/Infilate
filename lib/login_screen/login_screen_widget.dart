import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infilate/index.dart';
import 'package:infilate/main_screen.dart';
import 'package:infilate/mainpage.dart';
import 'package:infilate/services/user_provider.dart';
import 'package:infilate/twilio_number_verify.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../backend/api_requests/api_calls.dart';
import '../components/o_t_p_verification_widget.dart';
import '../create_profile/create_profile_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  String? dropDownValue;
  String verifyCode = "";
  String otpCode = "";
  TextEditingController? textController2;
  TextEditingController? textController1;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  // signInWithPhoneNumber() async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: '${dropDownValue}${textController2!.text}',
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await FirebaseAuth.instance.signInWithCredential(credential).then(
  //         (value) async {
  //           // final firestore = FirebaseFirestore.instance;
  //             final DocumentSnapshot? userDoc = await FirebaseFirestore.instance
  //                 .collection("infilateAppUsers")
  //                 .doc(value.user!.uid)
  //                 .get();
  //             if (userDoc == null) {
  //               if (value.user != null) {
  //                 // if(value.user.uid.)
  //                 Navigator.push(context,
  //                     MaterialPageRoute(builder: (ctx) => CreateProfileWidget()));
  //               } else {
  //                 print('user null');
  //               }
  //             }
  //         },
  //       );
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       print(e.message);
  //       Fluttertoast.showToast(msg: e.code);
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       setState(() {
  //         verifyCode = verificationId;
  //       });
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF012139),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 36, 0, 0),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Align(
                alignment: AlignmentDirectional(-1, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: ImageIcon(
                            AssetImage("assets/images/back.png"),
                          ),
                          // Icon(
                          //   Icons.arrow_back_outlined,
                          //   color: FlutterFlowTheme.of(context).primaryText,
                          //   size: 30,
                          // ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'vloztxa1' /* Login */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Manrope',
                                    color: Color(0xFF01213A),
                                    fontSize: 27,
                                    fontWeight: FontWeight.w800,
                                  ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 0, 20),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '4xakabw2' /* Please Enter Your Details */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Manrope',
                              color: Color(0xFF858585),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'ver7y0hr' /* Enter your Location */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Manrope',
                              color: Color(0xFF858585),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Color(0xFF949496),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController1,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: FFLocalizations.of(context).getText(
                                    '7nsm5g2x' /* Enter City Location */,
                                  ),
                                  hintStyle: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0xFFB3B3B3),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(15, 20, 0, 0),
                    //   child: Text(
                    //     FFLocalizations.of(context).getText(
                    //       'mfytym34' /* Enter your phone */,
                    //     ),
                    //     style: FlutterFlowTheme.of(context).bodyText1.override(
                    //           fontFamily: 'Manrope',
                    //           color: Color(0xFF858585),
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(5),
                    //       border: Border.all(
                    //         color: Color(0xFF949496),
                    //       ),
                    //     ),
                    //     child: Row(
                    //       mainAxisSize: MainAxisSize.max,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Padding(
                    //           padding:
                    //               EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    //           child: FutureBuilder<ApiCallResponse>(
                    //             future: CountryCodeCall.call(),
                    //             builder: (context, snapshot) {
                    //               // Customize what your widget looks like when it's loading.
                    //               if (!snapshot.hasData) {
                    //                 return Center(
                    //                   child: SizedBox(
                    //                     width: 50,
                    //                     height: 50,
                    //                     child: CircularProgressIndicator(
                    //                       color: FlutterFlowTheme.of(context)
                    //                           .primaryColor,
                    //                     ),
                    //                   ),
                    //                 );
                    //               }
                    //               final dropDownCountryCodeResponse =
                    //                   snapshot.data!;
                    //               return FlutterFlowDropDown(
                    //                 initialOption: dropDownValue ??=
                    //                     FFLocalizations.of(context).getText(
                    //                   'lftlm4an' /* +91 */,
                    //                 ),
                    //                 options: (CountryCodeCall.dialCode(
                    //                   dropDownCountryCodeResponse.jsonBody,
                    //                 ) as List)
                    //                     .map<String>((s) => s.toString())
                    //                     .toList()
                    //                     .toList(),
                    //                 onChanged: (val) =>
                    //                     setState(() => dropDownValue = val),
                    //                 width: 70,
                    //                 height: 50,
                    //                 textStyle: FlutterFlowTheme.of(context)
                    //                     .bodyText1
                    //                     .override(
                    //                       fontFamily: 'Manrope',
                    //                       color: Color(0xFF7C7979),
                    //                       fontSize: 16,
                    //                       fontWeight: FontWeight.w700,
                    //                     ),
                    //                 hintText:
                    //                     FFLocalizations.of(context).getText(
                    //                   'hihgzgen' /* +91 */,
                    //                 ),
                    //                 icon: Icon(
                    //                   Icons.keyboard_arrow_down,
                    //                   color: FlutterFlowTheme.of(context)
                    //                       .primaryText,
                    //                   size: 15,
                    //                 ),
                    //                 elevation: 0,
                    //                 borderColor: Colors.transparent,
                    //                 borderWidth: 0,
                    //                 borderRadius: 0,
                    //                 margin: EdgeInsetsDirectional.fromSTEB(
                    //                     12, 4, 12, 4),
                    //                 hidesUnderline: true,
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //         // Divider(
                    //         //   color: Colors.black,
                    //         //   thickness: 5,
                    //         //   height: 40,
                    //         //   indent: 2,
                    //         //   endIndent: 2,
                    //         // ),
                    //         // VerticalDivider(
                    //         //   color: Colors.black.withOpacity(0.3),
                    //         //   thickness: 5,
                    //         // ),
                    //         Center(
                    //           child: Container(
                    //             width: 1,
                    //             height: 50,
                    //             decoration: BoxDecoration(
                    //               color: Color(0xFF858585),
                    //             ),
                    //           ),
                    //         ),
                    //         Expanded(
                    //           child: TextFormField(
                    //             controller: textController2,
                    //             obscureText: false,
                    //             keyboardType: TextInputType.number,
                    //             decoration: InputDecoration(
                    //               hintText: FFLocalizations.of(context).getText(
                    //                 'upbgmjz3' /* Enter Phone Number */,
                    //               ),
                    //               hintStyle: GoogleFonts.manrope(
                    //                 fontWeight: FontWeight.w700,
                    //                 fontSize: 16,
                    //                 color: Color(0xFFB3B3B3),
                    //               ),
                    //               enabledBorder: UnderlineInputBorder(
                    //                 borderSide: BorderSide(
                    //                   color: Color(0x00000000),
                    //                   width: 1,
                    //                 ),
                    //                 borderRadius: const BorderRadius.only(
                    //                   topLeft: Radius.circular(4.0),
                    //                   topRight: Radius.circular(4.0),
                    //                 ),
                    //               ),
                    //               focusedBorder: UnderlineInputBorder(
                    //                 borderSide: BorderSide(
                    //                   color: Color(0x00000000),
                    //                   width: 1,
                    //                 ),
                    //                 borderRadius: const BorderRadius.only(
                    //                   topLeft: Radius.circular(4.0),
                    //                   topRight: Radius.circular(4.0),
                    //                 ),
                    //               ),
                    //             ),
                    //             style: FlutterFlowTheme.of(context)
                    //                 .bodyText1
                    //                 .override(
                    //                   fontFamily: 'Manrope',
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.bold,
                    //                 ),
                    //             textAlign: TextAlign.center,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsetsDirectional.fromSTEB(15, 30, 15, 0),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //         width: MediaQuery.of(context).size.width * 0.4,
                    //         height: 1,
                    //         decoration: BoxDecoration(
                    //           color: Color(0xFFB3B3B3),
                    //         ),
                    //       ),
                    //       Text(
                    //         FFLocalizations.of(context).getText(
                    //           'manb6a3d' /* or */,
                    //         ),
                    //         style: FlutterFlowTheme.of(context).bodyText1,
                    //       ),
                    //       Container(
                    //         width: MediaQuery.of(context).size.width * 0.4,
                    //         height: 1,
                    //         decoration: BoxDecoration(
                    //           color: Color(0xFFB3B3B3),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Container(
                          width: 180,
                          height: 44,
                          child: Stack(
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();

                                    final provider = Provider.of<UserProvider>(
                                        context,
                                        listen: false);
                                    provider.googleLogin().then((value) async {
                                      final user =
                                          FirebaseAuth.instance.currentUser;
                                      print("looooooooooooooogin scree data");
                                      print(user);
                                      print(user!.displayName);
                                      print(user.email);
                                      print(user.phoneNumber);
                                      final DocumentSnapshot userDoc =
                                          await FirebaseFirestore.instance
                                              .collection("publisher_database")
                                              .doc(user.uid)
                                              .get();
                                      if (!userDoc.exists) {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    TwilioNumberVerify(
                                                      name: user.displayName,
                                                      email: user.email,
                                                    )));
                                      } else {
                                        if (prefs.getString("unicode") ==
                                            null) {
                                          await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      RegisterScreenWidget()));
                                        }
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    MainScreen()));
                                      }
                                    });
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'lkclc1fx' /* Use Google */,
                                  ),
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.transparent,
                                    size: 20,
                                  ),
                                  options: FFButtonOptions(
                                    width: 200,
                                    height: 44,
                                    color: Colors.transparent,
                                    textStyle: GoogleFonts.getFont(
                                      'Manrope',
                                      color: Color(0xFF606060),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Color(0xFF949496),
                                      width: 0,
                                    ),
                                    borderRadius: BorderRadius.circular(87),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.83, 0),
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://i0.wp.com/nanophorm.com/wp-content/uploads/2018/04/google-logo-icon-PNG-Transparent-Background.png?w=1000&ssl=1',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Group_402.png',
                            ).image,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 25, 16, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (textController2!.text.length != 10) {
                              Fluttertoast.showToast(
                                  msg: "Please enter a valid number");
                            } else {
                              await showModalBottomSheet(
                                isScrollControlled: false,
                                isDismissible: false,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.of(context).viewInsets,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.4,
                                      child: OTPVerificationWidget(
                                        dialCode: dropDownValue,
                                        phoneNumber:
                                            textController2!.text.trim(),
                                      ),
                                    ),
                                  );
                                },
                              );
                              // await Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => CreateProfileWidget(),
                              //   ),
                              // );
                            }
                          },
                          text: FFLocalizations.of(context).getText(
                            '9cudaprj' /* SUBMIT */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 48,
                            color: Color(0xFF0044EB),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Chivo',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(87),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '41lbtfhd' /* By clicking here start you agr... */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Manrope',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '7uj9iyrs' /* Privacy Policy and terms */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Manrope',
                              color: Color(0xFF3D9BFC),
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
