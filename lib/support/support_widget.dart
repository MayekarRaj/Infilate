import '../components/seaa_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({Key? key}) : super(key: key);

  @override
  _SupportWidgetState createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController();
    textController4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF012139),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                '88mlvksi' /* Support */,
              ),
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Manrope',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: FaIcon(
              FontAwesomeIcons.solidQuestionCircle,
              color: Colors.white,
              size: 25,
            ),
            onPressed: () {
              showDialog(context: context, builder: (_) => SeaaWidget());
            },
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFF122139),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.87,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFF01213A),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'dc9qgam6' /* How can 
        we Help you? */
                            ,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Manrope',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Container(
                          width: 134,
                          height: 147,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: Image.asset(
                                'assets/images/Headphone3D_1.png',
                              ).image,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 0, 0),
                                  child: Container(
                                    width: 48,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/Rectangle_143.png',
                                        ).image,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 10, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/Group_470.png',
                                                  ).image,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '4rnc1h9u' /* Chat with us */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/Group_471.png',
                                                  ).image,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'j6eencd4' /* Email us */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/Group_472.png',
                                                  ).image,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'tqxscuxr' /* Call us */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.85, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 45, 0, 15),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '568lkmuw' /* FAQ */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Manrope',
                                              color: Color(0xFF868686),
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Container(
                                      width: 329,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xFFCCCCCC),
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            's9ab21g6' /* What is infilate app */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Container(
                                      width: 329,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xFFCCCCCC),
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ag14yt5u' /* What is your name */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Container(
                                      width: 329,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xFFCCCCCC),
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '5eln7y79' /* What sample question? */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 10),
                                    child: Container(
                                      width: 329,
                                      height: 46,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xFFCCCCCC),
                                          width: 0.5,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'l9lzyucd' /* All new sample questions */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsetsDirectional.fromSTEB(
                                  //       10, 0, 10, 10),
                                  //   child: Container(
                                  //     width: 329,
                                  //     height: 46,
                                  //     decoration: BoxDecoration(
                                  //       color: FlutterFlowTheme.of(context)
                                  //           .primaryBtnText,
                                  //       borderRadius: BorderRadius.circular(8),
                                  //       border: Border.all(
                                  //         color: Color(0xFFCCCCCC),
                                  //         width: 0.5,
                                  //       ),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           10, 0, 0, 0),
                                  //       child: TextFormField(
                                  //         controller: textController2,
                                  //         autofocus: true,
                                  //         obscureText: false,
                                  //         decoration: InputDecoration(
                                  //           hintText: FFLocalizations.of(context)
                                  //               .getText(
                                  //             'ag14yt5u' /* What is your name */,
                                  //           ),
                                  //           hintStyle:
                                  //               FlutterFlowTheme.of(context)
                                  //                   .bodyText2,
                                  //           enabledBorder: UnderlineInputBorder(
                                  //             borderSide: BorderSide(
                                  //               color: Color(0x00000000),
                                  //               width: 1,
                                  //             ),
                                  //             borderRadius:
                                  //                 const BorderRadius.only(
                                  //               topLeft: Radius.circular(4.0),
                                  //               topRight: Radius.circular(4.0),
                                  //             ),
                                  //           ),
                                  //           focusedBorder: UnderlineInputBorder(
                                  //             borderSide: BorderSide(
                                  //               color: Color(0x00000000),
                                  //               width: 1,
                                  //             ),
                                  //             borderRadius:
                                  //                 const BorderRadius.only(
                                  //               topLeft: Radius.circular(4.0),
                                  //               topRight: Radius.circular(4.0),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyText1
                                  //             .override(
                                  //               fontFamily: 'Manrope',
                                  //               fontWeight: FontWeight.bold,
                                  //             ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsetsDirectional.fromSTEB(
                                  //       10, 0, 10, 10),
                                  //   child: Container(
                                  //     width: 329,
                                  //     height: 46,
                                  //     decoration: BoxDecoration(
                                  //       color: FlutterFlowTheme.of(context)
                                  //           .primaryBtnText,
                                  //       borderRadius: BorderRadius.circular(8),
                                  //       border: Border.all(
                                  //         color: Color(0xFFCCCCCC),
                                  //         width: 0.5,
                                  //       ),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           10, 0, 0, 0),
                                  //       child: TextFormField(
                                  //         controller: textController3,
                                  //         autofocus: true,
                                  //         obscureText: false,
                                  //         decoration: InputDecoration(
                                  //           hintText: FFLocalizations.of(context)
                                  //               .getText(
                                  //             '5eln7y79' /* What sample question? */,
                                  //           ),
                                  //           hintStyle:
                                  //               FlutterFlowTheme.of(context)
                                  //                   .bodyText2,
                                  //           enabledBorder: UnderlineInputBorder(
                                  //             borderSide: BorderSide(
                                  //               color: Color(0x00000000),
                                  //               width: 1,
                                  //             ),
                                  //             borderRadius:
                                  //                 const BorderRadius.only(
                                  //               topLeft: Radius.circular(4.0),
                                  //               topRight: Radius.circular(4.0),
                                  //             ),
                                  //           ),
                                  //           focusedBorder: UnderlineInputBorder(
                                  //             borderSide: BorderSide(
                                  //               color: Color(0x00000000),
                                  //               width: 1,
                                  //             ),
                                  //             borderRadius:
                                  //                 const BorderRadius.only(
                                  //               topLeft: Radius.circular(4.0),
                                  //               topRight: Radius.circular(4.0),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyText1
                                  //             .override(
                                  //               fontFamily: 'Manrope',
                                  //               fontWeight: FontWeight.bold,
                                  //             ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsetsDirectional.fromSTEB(
                                  //       10, 0, 10, 10),
                                  //   child: Container(
                                  //     width: 329,
                                  //     height: 46,
                                  //     decoration: BoxDecoration(
                                  //       color: FlutterFlowTheme.of(context)
                                  //           .primaryBtnText,
                                  //       borderRadius: BorderRadius.circular(8),
                                  //       border: Border.all(
                                  //         color: Color(0xFFCCCCCC),
                                  //         width: 0.5,
                                  //       ),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           10, 0, 0, 0),
                                  //       child: TextFormField(
                                  //         controller: textController4,
                                  //         autofocus: true,
                                  //         obscureText: false,
                                  //         decoration: InputDecoration(
                                  //           hintText: FFLocalizations.of(context)
                                  //               .getText(
                                  //             'l9lzyucd' /* All new sample questions */,
                                  //           ),
                                  //           hintStyle:
                                  //               FlutterFlowTheme.of(context)
                                  //                   .bodyText2,
                                  //           enabledBorder: UnderlineInputBorder(
                                  //             borderSide: BorderSide(
                                  //               color: Color(0x00000000),
                                  //               width: 1,
                                  //             ),
                                  //             borderRadius:
                                  //                 const BorderRadius.only(
                                  //               topLeft: Radius.circular(4.0),
                                  //               topRight: Radius.circular(4.0),
                                  //             ),
                                  //           ),
                                  //           focusedBorder: UnderlineInputBorder(
                                  //             borderSide: BorderSide(
                                  //               color: Color(0x00000000),
                                  //               width: 1,
                                  //             ),
                                  //             borderRadius:
                                  //                 const BorderRadius.only(
                                  //               topLeft: Radius.circular(4.0),
                                  //               topRight: Radius.circular(4.0),
                                  //             ),
                                  //           ),
                                  //         ),
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyText1
                                  //             .override(
                                  //               fontFamily: 'Manrope',
                                  //               fontWeight: FontWeight.bold,
                                  //             ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsetsDirectional.fromSTEB(
                                  //       0, 20, 0, 0),
                                  //   child: Container(
                                  //     width: 328,
                                  //     height: 48,
                                  //     decoration: BoxDecoration(
                                  //       color: Color(0xFF01213A),
                                  //       borderRadius: BorderRadius.circular(30),
                                  //     ),
                                  //     child: Padding(
                                  //       padding: EdgeInsetsDirectional.fromSTEB(
                                  //           0, 15, 0, 0),
                                  //       child: Text(
                                  //         FFLocalizations.of(context).getText(
                                  //           '8yibxidf' /* DONE */,
                                  //         ),
                                  //         textAlign: TextAlign.center,
                                  //         style: FlutterFlowTheme.of(context)
                                  //             .bodyText1
                                  //             .override(
                                  //               fontFamily: 'Manrope',
                                  //               color:
                                  //                   FlutterFlowTheme.of(context)
                                  //                       .primaryBtnText,
                                  //             ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
