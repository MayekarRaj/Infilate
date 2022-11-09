import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:infilate/add_customer.dart';
import 'package:infilate/components/seaa_widget.dart';
import 'package:infilate/constants.dart';
import 'package:share_plus/share_plus.dart';

import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow/flutter_flow_widgets.dart';

class SellnearndetailWidget extends StatefulWidget {
  final String? id;
  final String? name;
  final String? pricing;
  final String? details;
  final String? img;
  final String? tnc;

  SellnearndetailWidget({
    Key? key,
    this.name,
    this.id,
    this.pricing,
    this.details,
    this.img,
    this.tnc,
  }) : super(key: key);

  @override
  _SellnearndetailWidgetState createState() => _SellnearndetailWidgetState();
}

class _SellnearndetailWidgetState extends State<SellnearndetailWidget> {
  PageController? pageViewController;
  String? choiceChipsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          icon: backwhite,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.name ?? "Sell n Earn",
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Manrope',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
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
              showDialog(
                  context: context,
                  builder: (_) {
                    return SeaaWidget();
                  });
            },
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBtnText,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 15, 10, 15),
                  child: Container(
                    width: double.infinity,
                    height: 197,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: Image.asset(
                          'assets/images/price.png',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              "How much will you earn?",
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                          Text(
                            "₹${widget.pricing}",
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Chivo',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 32,
                                ),
                          ),
                          Text(
                            "Commission on every sale",
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Manrope',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30, 0, 15, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AddCustomer(
                              id: widget.id!,
                              name: widget.name!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 134,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Color(0xFF317DFC),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                          child: Text(
                            "Add Customer",
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Manrope',
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  fontSize: 13,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Container(
                        width: 100,
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.transparent,
                          ),
                        ),
                        child: InkWell(
                          onTap: () async {
                            try {
                              final data = await FirebaseFirestore.instance
                                  .collection("publisher_database")
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .get();

                              print(data["name"]);
                              print(data["trackingURLs"]);

                              print(data["trackingURLs"][widget.id]);

                              final link = data["trackingURLs"][widget.id]
                                  ["trackingLink"];

                              print(
                                  "LLLLLLLLLLLLLLLLIIIIIIIIIIIINNNNNNNNNNNKKKKKKKKK, $link");
                              await Share.share("Tracking Link: $link");
                            } catch (e) {
                              print("Can't share link");
                              Fluttertoast.showToast(msg: "Can't share link");
                              // await Share.share("OOOO");
                            }

                            // await Share.share("Tracking Link: $link");
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 0, 5, 0),
                                  child: Icon(
                                    Icons.share_rounded,
                                    color: Color(0xFF317DFC),
                                    size: 20,
                                  ),
                                ),
                              ),
                              Text(
                                "Share",
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Color(0xFF317DFC),
                                      fontSize: 14,
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
              Expanded(
                  child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Color(0xFFD7E1EF),
                          ),
                          borderRadius: BorderRadius.circular(84),
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: Color(0xFF8EB9FB),
                            borderRadius: BorderRadius.circular(84),
                          ),
                          indicatorColor: Color(0xFF8EB9FB),
                          // indicatorWeight: 0.1,
                          labelStyle: GoogleFonts.manrope(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff01213A),
                          ),
                          labelColor: Color(0xFF01213A),
                          unselectedLabelColor: Color(0xFF828282),
                          tabs: [
                            Tab(
                              text: "Profile",
                            ),
                            Tab(
                              text: "Detail",
                            ),
                            // Tab(
                            //   text: "How to Perform",
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 5, 0, 0),
                                      child: Container(
                                        width: 282,
                                        height: 158,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: widget.img == null
                                                ? Image.asset(
                                                    'assets/images/axis-bank-zero-balance-account-500x500_1.png',
                                                  ).image
                                                : Image.network(widget.img!)
                                                    .image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 20,
                                    ),
                                    child: FFButtonWidget(
                                      onPressed: () async {},
                                      text: FFLocalizations.of(context).getText(
                                        'trainingvids',
                                      ),
                                      icon: Icon(Icons.videocam),
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 35,
                                        color: Color(0xFF317DFC),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
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
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 59,
                                              width: 59,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFACDDB6),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "05",
                                                  style: GoogleFonts.manrope(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "Eligible",
                                              style: GoogleFonts.manrope(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 59,
                                              width: 59,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEC6BA),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "05",
                                                  style: GoogleFonts.manrope(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "Non-Eligible",
                                              style: GoogleFonts.manrope(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              height: 59,
                                              width: 59,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFC4B2E4),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "05",
                                                  style: GoogleFonts.manrope(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "Non-verified",
                                              style: GoogleFonts.manrope(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 59,
                                              height: 59,
                                              padding: EdgeInsets.all(14),
                                              decoration: BoxDecoration(
                                                // color: Colors.black,
                                                color: white,
                                                // image: DecorationImage(
                                                //   fit: BoxFit.cover,
                                                //   image: Image.asset(
                                                //     'assets/images/creditcard.png',
                                                //   ).image,
                                                // ),
                                              ),
                                              child: Image.asset(
                                                'assets/images/document.png',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "My Leads",
                                              style: GoogleFonts.manrope(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 30),
                                    child: Container(
                                      width: 320,
                                      height: 56,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: Image.asset(
                                            'assets/images/Group_201.png',
                                          ).image,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 1,
                            decoration: BoxDecoration(
                              color:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        // Text(widget.details!),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-0.85, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'j167fppr' /* How it works? */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 20, 0),
                                    child: Text(
                                      widget.details ?? "Details",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: Color(0xFF8F8F8F),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 15, 0, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-0.85, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 15, 0, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'n56hufaw' /* Terms and Conditions */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 20, 30),
                                    child: Text(
                                      widget.tnc ?? "Terms and Conditions",
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: Color(0xFF8F8F8F),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              )
                  // Column(
                  //   mainAxisSize: MainAxisSize.max,
                  //   children: [
                  //     // Padding(
                  //     //   padding: EdgeInsets.symmetric(horizontal: 10),
                  //     //   child: Container(
                  //     //     padding: EdgeInsets.symmetric(horizontal: 10),
                  //     //     decoration: BoxDecoration(
                  //     //       borderRadius: BorderRadius.circular(30),
                  //     //       border: Border.all(color: Colors.black),
                  //     //     ),
                  //     //     child: DefaultTabController(
                  //     //       length: 3,
                  //     //       child: TabBar(
                  //     //         indicatorSize: TabBarIndicatorSize.tab,
                  //     //         indicatorWeight: 0.1,
                  //     //         labelColor: Colors.black,
                  //     //         labelStyle: TextStyle(
                  //     //             // color: Colors.black,
                  //     //             ),
                  //     //         tabs: [
                  //     //           Tab(text: "Profit"),
                  //     //           Tab(text: "Detail"),
                  //     //           Tab(text: "How to Perform"),
                  //     //         ],
                  //     //       ),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     // Padding(
                  //     //   padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                  //     //   child: Container(
                  //     //     width: MediaQuery.of(context).size.width,
                  //     //     height: 40,
                  //     //     decoration: BoxDecoration(
                  //     //       borderRadius: BorderRadius.circular(30),
                  //     //       border: Border.all(
                  //     //         color: Color(0xFFB4B4B4),
                  //     //       ),
                  //     //     ),
                  //     //     child: Align(
                  //     //       alignment: AlignmentDirectional(0, 0),
                  //     //       child: FlutterFlowChoiceChips(
                  //     //         initiallySelected: [
                  //     //           // choiceChipsValue.l
                  //     //           if (choiceChipsValue != null) choiceChipsValue!
                  //     //         ],
                  //     //         options: [
                  //     //           ChipData(FFLocalizations.of(context).getText(
                  //     //             'jhnpwtc6' /* Profit */,
                  //     //           )),
                  //     //           ChipData(FFLocalizations.of(context).getText(
                  //     //             'dzmb8mpw' /* Details */,
                  //     //           )),
                  //     //           ChipData(FFLocalizations.of(context).getText(
                  //     //             'l16g0lwm' /* How to Perform */,
                  //     //           ))
                  //     //         ],
                  //     //         onChanged: (val) =>
                  //     //             setState(() => choiceChipsValue = val?.first),
                  //     //         selectedChipStyle: ChipStyle(
                  //     //           backgroundColor: Color(0xFF323B45),
                  //     //           textStyle: FlutterFlowTheme.of(context)
                  //     //               .bodyText1
                  //     //               .override(
                  //     //                 fontFamily: 'Manrope',
                  //     //                 color: Colors.white,
                  //     //               ),
                  //     //           iconColor:
                  //     //               FlutterFlowTheme.of(context).primaryBtnText,
                  //     //           iconSize: 18,
                  //     //           elevation: 0,
                  //     //         ),
                  //     //         unselectedChipStyle: ChipStyle(
                  //     //           backgroundColor: Colors.white,
                  //     //           textStyle: FlutterFlowTheme.of(context)
                  //     //               .bodyText2
                  //     //               .override(
                  //     //                 fontFamily: 'Manrope',
                  //     //                 color: Color(0xFF323B45),
                  //     //               ),
                  //     //           iconColor: Color(0xFF323B45),
                  //     //           iconSize: 18,
                  //     //           elevation: 0,
                  //     //         ),
                  //     //         chipSpacing: 15,
                  //     //         multiselect: false,
                  //     //         alignment: WrapAlignment.start,
                  //     //       ),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //     Expanded(
                  //       child: PageView(
                  //         // physics: const NeverScrollableScrollPhysics(),
                  //         controller: pageViewController ??=
                  //             PageController(initialPage: 0),
                  //         scrollDirection: Axis.horizontal,
                  //         children: [
                  //           Container(
                  //             width: MediaQuery.of(context).size.width,
                  //             height: MediaQuery.of(context).size.height * 1,
                  //             decoration: BoxDecoration(
                  //               color: Colors.transparent,
                  //             ),
                  //             child: SingleChildScrollView(
                  //               child: Column(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 children: [
                  //                   Align(
                  //                     alignment: AlignmentDirectional(0, 0),
                  //                     child: Padding(
                  //                       padding: EdgeInsetsDirectional.fromSTEB(
                  //                           0, 5, 0, 0),
                  //                       child: Container(
                  //                         width: 282,
                  //                         height: 158,
                  //                         decoration: BoxDecoration(
                  //                           color: Colors.transparent,
                  //                           image: DecorationImage(
                  //                             fit: BoxFit.cover,
                  //                             image: widget.img == null
                  //                                 ? Image.asset(
                  //                                     'assets/images/axis-bank-zero-balance-account-500x500_1.png',
                  //                                   ).image
                  //                                 : Image.network(widget.img!)
                  //                                     .image,
                  //                           ),
                  //                           borderRadius:
                  //                               BorderRadius.circular(8),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                       horizontal: 40,
                  //                       vertical: 20,
                  //                     ),
                  //                     child: FFButtonWidget(
                  //                       onPressed: () async {},
                  //                       text: FFLocalizations.of(context).getText(
                  //                         'trainingvids',
                  //                       ),
                  //                       icon: Icon(Icons.videocam),
                  //                       options: FFButtonOptions(
                  //                         width: double.infinity,
                  //                         height: 35,
                  //                         color: Color(0xFF317DFC),
                  //                         textStyle: FlutterFlowTheme.of(context)
                  //                             .subtitle2
                  //                             .override(
                  //                               fontFamily: 'Manrope',
                  //                               color: Colors.white,
                  //                             ),
                  //                         borderSide: BorderSide(
                  //                           color: Colors.transparent,
                  //                           width: 1,
                  //                         ),
                  //                         borderRadius: BorderRadius.circular(87),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsets.symmetric(
                  //                       horizontal: 40,
                  //                       vertical: 10,
                  //                     ),
                  //                     child: Row(
                  //                       mainAxisAlignment:
                  //                           MainAxisAlignment.spaceBetween,
                  //                       children: [
                  //                         Column(
                  //                           children: [
                  //                             Container(
                  //                               height: 59,
                  //                               width: 59,
                  //                               decoration: BoxDecoration(
                  //                                 color: Color(0xFFACDDB6),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(8),
                  //                               ),
                  //                               child: Center(
                  //                                 child: Text(
                  //                                   "05",
                  //                                   style: GoogleFonts.manrope(
                  //                                     fontSize: 19,
                  //                                     fontWeight: FontWeight.w700,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             const SizedBox(
                  //                               height: 4,
                  //                             ),
                  //                             Text(
                  //                               "Eligible",
                  //                               style: GoogleFonts.manrope(
                  //                                 fontSize: 10,
                  //                                 fontWeight: FontWeight.w500,
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         Column(
                  //                           children: [
                  //                             Container(
                  //                               height: 59,
                  //                               width: 59,
                  //                               decoration: BoxDecoration(
                  //                                 color: Color(0xFFEEC6BA),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(8),
                  //                               ),
                  //                               child: Center(
                  //                                 child: Text(
                  //                                   "05",
                  //                                   style: GoogleFonts.manrope(
                  //                                     fontSize: 19,
                  //                                     fontWeight: FontWeight.w700,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             const SizedBox(
                  //                               height: 4,
                  //                             ),
                  //                             Text(
                  //                               "Non-Eligible",
                  //                               style: GoogleFonts.manrope(
                  //                                 fontSize: 10,
                  //                                 fontWeight: FontWeight.w500,
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         Column(
                  //                           children: [
                  //                             Container(
                  //                               height: 59,
                  //                               width: 59,
                  //                               decoration: BoxDecoration(
                  //                                 color: Color(0xFFC4B2E4),
                  //                                 borderRadius:
                  //                                     BorderRadius.circular(8),
                  //                               ),
                  //                               child: Center(
                  //                                 child: Text(
                  //                                   "05",
                  //                                   style: GoogleFonts.manrope(
                  //                                     fontSize: 19,
                  //                                     fontWeight: FontWeight.w700,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                             const SizedBox(
                  //                               height: 4,
                  //                             ),
                  //                             Text(
                  //                               "Non-verified",
                  //                               style: GoogleFonts.manrope(
                  //                                 fontSize: 10,
                  //                                 fontWeight: FontWeight.w500,
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         ),
                  //                         Column(
                  //                           children: [
                  //                             Container(
                  //                               width: 59,
                  //                               height: 59,
                  //                               padding: EdgeInsets.all(14),
                  //                               decoration: BoxDecoration(
                  //                                 // color: Colors.black,
                  //                                 color: white,
                  //                                 // image: DecorationImage(
                  //                                 //   fit: BoxFit.cover,
                  //                                 //   image: Image.asset(
                  //                                 //     'assets/images/creditcard.png',
                  //                                 //   ).image,
                  //                                 // ),
                  //                               ),
                  //                               child: Image.asset(
                  //                                 'assets/images/document.png',
                  //                               ),
                  //                             ),
                  //                             const SizedBox(
                  //                               height: 4,
                  //                             ),
                  //                             Text(
                  //                               "My Leads",
                  //                               style: GoogleFonts.manrope(
                  //                                 fontSize: 10,
                  //                                 fontWeight: FontWeight.w500,
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         )
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsetsDirectional.fromSTEB(
                  //                         0, 20, 0, 30),
                  //                     child: Container(
                  //                       width: 320,
                  //                       height: 56,
                  //                       decoration: BoxDecoration(
                  //                         color: Colors.transparent,
                  //                         image: DecorationImage(
                  //                           fit: BoxFit.cover,
                  //                           image: Image.asset(
                  //                             'assets/images/Group_201.png',
                  //                           ).image,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             width: MediaQuery.of(context).size.width,
                  //             height: MediaQuery.of(context).size.height * 1,
                  //             decoration: BoxDecoration(
                  //               color:
                  //                   FlutterFlowTheme.of(context).primaryBtnText,
                  //             ),
                  //             child: SingleChildScrollView(
                  //               child: Column(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 children: [
                  //                   SingleChildScrollView(
                  //                     child: Column(
                  //                       mainAxisSize: MainAxisSize.max,
                  //                       children: [
                  //                         // Text(widget.details!),
                  //                         Align(
                  //                           alignment:
                  //                               AlignmentDirectional(-0.85, 0),
                  //                           child: Padding(
                  //                             padding:
                  //                                 EdgeInsetsDirectional.fromSTEB(
                  //                                     0, 10, 0, 0),
                  //                             child: Text(
                  //                               FFLocalizations.of(context)
                  //                                   .getText(
                  //                                 'j167fppr' /* How it works? */,
                  //                               ),
                  //                               textAlign: TextAlign.start,
                  //                               style:
                  //                                   FlutterFlowTheme.of(context)
                  //                                       .bodyText1
                  //                                       .override(
                  //                                         fontFamily: 'Manrope',
                  //                                         fontWeight:
                  //                                             FontWeight.bold,
                  //                                       ),
                  //                             ),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsetsDirectional.fromSTEB(
                  //                         20, 10, 20, 0),
                  //                     child: Text(
                  //                       widget.details ?? "Details",
                  //                       style: FlutterFlowTheme.of(context)
                  //                           .bodyText1
                  //                           .override(
                  //                             fontFamily: 'Manrope',
                  //                             color: Color(0xFF8F8F8F),
                  //                             fontSize: 12,
                  //                             fontWeight: FontWeight.w500,
                  //                           ),
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsetsDirectional.fromSTEB(
                  //                         0, 15, 0, 0),
                  //                     child: Container(
                  //                       width: MediaQuery.of(context).size.width,
                  //                       height: 10,
                  //                       decoration: BoxDecoration(
                  //                         color: FlutterFlowTheme.of(context)
                  //                             .primaryBtnText,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Align(
                  //                     alignment: AlignmentDirectional(-0.85, 0),
                  //                     child: Padding(
                  //                       padding: EdgeInsetsDirectional.fromSTEB(
                  //                           0, 15, 0, 0),
                  //                       child: Text(
                  //                         FFLocalizations.of(context).getText(
                  //                           'n56hufaw' /* Terms and Conditions */,
                  //                         ),
                  //                         style: FlutterFlowTheme.of(context)
                  //                             .bodyText1,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Padding(
                  //                     padding: EdgeInsetsDirectional.fromSTEB(
                  //                         20, 10, 20, 30),
                  //                     child: Text(
                  //                       widget.tnc ?? "Terms and Conditions",
                  //                       style: FlutterFlowTheme.of(context)
                  //                           .bodyText1
                  //                           .override(
                  //                             fontFamily: 'Manrope',
                  //                             color: Color(0xFF8F8F8F),
                  //                             fontSize: 12,
                  //                             fontWeight: FontWeight.w500,
                  //                           ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  //
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
