import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:infilate/components/seaa_widget.dart';
import 'package:infilate/constants.dart';
import 'package:infilate/index.dart';

import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageleadWidget extends StatefulWidget {
  const ManageleadWidget({Key? key}) : super(key: key);

  @override
  _ManageleadWidgetState createState() => _ManageleadWidgetState();
}

class _ManageleadWidgetState extends State<ManageleadWidget> {
  String? choiceChipsValue1;
  String? choiceChipsValue2;
  String? choiceChipsValue3;
  String totalLeads = "0";
  String inprocessLeads = "0";
  String completedLeads = "0";
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    getLeadsInfo();
  }

  Color getColor(String status) {
    if (status == "Success") return Color(0xffCCFFB2);

    if (status == "Rejected") return Color(0xffFFB2B2);

    return Color(0xffF8DE81);
  }

  Future getLeadsInfo() async {
    final data = await FirebaseFirestore.instance
        .collection("Leads")
        .where("publisher_id",
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    // final data = await FirebaseFirestore.instance
    //     .collection("Leads")
    //     .where("publisher_id",
    //         isEqualTo: FirebaseAuth.instance.currentUser!.uid)
    //     .get();

    // data.size
    final allLeads = data.docs.length;
    final ipLeads =
        data.docs.where((element) => element["status"] == "In Process").length;
    final cLeads =
        data.docs.where((element) => element["status"] == "Success").length;
    print(allLeads);
    print(ipLeads);
    print(cLeads);

    setState(() {
      totalLeads = allLeads.toString();
      inprocessLeads = ipLeads.toString();
      completedLeads = cLeads.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF012139),
        automaticallyImplyLeading: false,
        leadingWidth: 15,
        leading: Container(
          width: 10,
        ),
        title: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              FFLocalizations.of(context).getText(
                'sgmfy3u3' /* Manage Lead */,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
            child: FFButtonWidget(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => SellEarnWidget()));
              },
              text: "Add Lead",
              icon: Icon(
                Icons.add,
                color: white,
                size: 16,
              ),
              options: FFButtonOptions(
                width: 94,
                height: 40,
                color: Color(0xFF0044EB),
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Manrope',
                      color: white,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
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
      backgroundColor: Color(0xFF122139),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 50,
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Color(0xFF012139),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0xFF003763),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF003763),
                                offset: Offset(-2, -2),
                              )
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                totalLeads,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Color(0xFFCAF7FD),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.white,
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Total Leads",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  color: Color(0xffD7E1EF),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 50,
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                        decoration: BoxDecoration(
                            color: Color(0xFF012139),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0xFF003763),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF003763),
                                offset: Offset(-2, -2),
                              )
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                inprocessLeads,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Color(0xFFEEC6BA),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.white,
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Leads Inprocess",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  color: Color(0xffD7E1EF),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 50,
                        padding:
                            EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                        decoration: BoxDecoration(
                            color: Color(0xFF012139),
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: Color(0xFF003763),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF003763),
                                offset: Offset(-2, -2),
                              )
                            ]),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                completedLeads,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Color(0xFFACDDB6),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.white,
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "Leads Completed",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.manrope(
                                  fontSize: 12,
                                  color: Color(0xffD7E1EF),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
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
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Container(
                              width: 48,
                              height: 4,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Rectangle_143.png',
                                  ).image,
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     height: 50,
                          //     decoration: BoxDecoration(
                          //       color: Colors.transparent,
                          //     ),
                          //     child: Padding(
                          //       padding:
                          //           EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                          //       child: Row(
                          //         mainAxisSize: MainAxisSize.max,
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           Container(
                          //             width: 57,
                          //             height: 40,
                          //             decoration: BoxDecoration(
                          //               color: Colors.transparent,
                          //               borderRadius: BorderRadius.circular(30),
                          //               border: Border.all(
                          //                 color: Color(0xFF8F8F8F),
                          //                 width: 1,
                          //               ),
                          //             ),
                          //             child: Padding(
                          //               padding: EdgeInsetsDirectional.fromSTEB(
                          //                   6, 0, 0, 0),
                          //               child: FlutterFlowChoiceChips(
                          //                 initiallySelected: [
                          //                   if (choiceChipsValue1 != null)
                          //                     choiceChipsValue1!
                          //                 ],
                          //                 options: [
                          //                   ChipData(
                          //                     FFLocalizations.of(context)
                          //                         .getText(
                          //                       'kd940jto' /* All */,
                          //                     ),
                          //                   )
                          //                 ],
                          //                 onChanged: (val) {
                          //                   setState(() =>
                          //                       choiceChipsValue1 = val?.first);
                          //                   print(choiceChipsValue1);
                          //                 },
                          //                 selectedChipStyle: ChipStyle(
                          //                   backgroundColor: Color(0xFF8EB9FB),
                          //                   textStyle:
                          //                       FlutterFlowTheme.of(context)
                          //                           .bodyText1
                          //                           .override(
                          //                             fontFamily: 'Manrope',
                          //                             color: Colors.white,
                          //                           ),
                          //                   iconColor: Colors.white,
                          //                   iconSize: 22,
                          //                   elevation: 0,
                          //                 ),
                          //                 unselectedChipStyle: ChipStyle(
                          //                   backgroundColor: Colors.white,
                          //                   textStyle:
                          //                       FlutterFlowTheme.of(context)
                          //                           .bodyText2
                          //                           .override(
                          //                             fontFamily: 'Manrope',
                          //                             color: Color(0xFF323B45),
                          //                             fontSize: 12,
                          //                           ),
                          //                   iconColor: Color(0xFF8EB9FB),
                          //                   iconSize: 22,
                          //                   elevation: 0,
                          //                 ),
                          //                 chipSpacing: 10,
                          //                 multiselect: false,
                          //                 alignment: WrapAlignment.start,
                          //               ),
                          //             ),
                          //           ),
                          //           Expanded(
                          //             child: Padding(
                          //               padding: EdgeInsetsDirectional.fromSTEB(
                          //                   6, 0, 0, 0),
                          //               child: Container(
                          //                 width: 100,
                          //                 height: 40,
                          //                 decoration: BoxDecoration(
                          //                   color: Colors.transparent,
                          //                   borderRadius:
                          //                       BorderRadius.circular(30),
                          //                   border: Border.all(
                          //                     color: Color(0xFF8F8F8F),
                          //                     width: 1,
                          //                   ),
                          //                 ),
                          //                 child: Padding(
                          //                   padding:
                          //                       EdgeInsetsDirectional.fromSTEB(
                          //                           5, 0, 5, 0),
                          //                   child: FlutterFlowChoiceChips(
                          //                     initiallySelected: [
                          //                       if (choiceChipsValue2 != null)
                          //                         choiceChipsValue2!
                          //                     ],
                          //                     options: [
                          //                       ChipData(
                          //                           FFLocalizations.of(context)
                          //                               .getText(
                          //                         'zpmsrkzm' /* In Process */,
                          //                       )),
                          //                       ChipData(
                          //                           FFLocalizations.of(context)
                          //                               .getText(
                          //                         'osv95djb' /* Complete */,
                          //                       )),
                          //                       ChipData(
                          //                           FFLocalizations.of(context)
                          //                               .getText(
                          //                         'iuq2l2mt' /* Rejection */,
                          //                       ))
                          //                     ],
                          //                     onChanged: (val) {
                          //                       setState(() =>
                          //                           choiceChipsValue2 =
                          //                               val?.first);
                          //                       print(choiceChipsValue2);
                          //                     },
                          //                     selectedChipStyle: ChipStyle(
                          //                       backgroundColor:
                          //                           Color(0xFF8EB9FB),
                          //                       textStyle:
                          //                           FlutterFlowTheme.of(context)
                          //                               .bodyText1
                          //                               .override(
                          //                                 fontFamily: 'Manrope',
                          //                                 color:
                          //                                     Color(0xFF01213A),
                          //                               ),
                          //                       iconColor: Colors.white,
                          //                       iconSize: 18,
                          //                       elevation: 0,
                          //                     ),
                          //                     unselectedChipStyle: ChipStyle(
                          //                       backgroundColor: Colors.white,
                          //                       textStyle:
                          //                           FlutterFlowTheme.of(context)
                          //                               .bodyText2
                          //                               .override(
                          //                                 fontFamily: 'Manrope',
                          //                                 color:
                          //                                     Color(0xFF828282),
                          //                                 fontSize: 12,
                          //                                 fontWeight:
                          //                                     FontWeight.w600,
                          //                               ),
                          //                       iconColor: Color(0xFF012138),
                          //                       iconSize: 18,
                          //                       elevation: 0,
                          //                     ),
                          //                     chipSpacing: 0,
                          //                     multiselect: false,
                          //                     alignment:
                          //                         WrapAlignment.spaceAround,
                          //                   ),
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Expanded(
                            child: DefaultTabController(
                              length: 4,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 16),
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
                                          borderRadius:
                                              BorderRadius.circular(84),
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
                                            child: Text("ALL"),
                                          ),
                                          Tab(
                                            text: "InProcess",
                                          ),
                                          Tab(
                                            text: "Completed",
                                          ),
                                          Tab(
                                            text: "Rejected",
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection("Leads")
                                                .where("publisher_id",
                                                    isEqualTo: FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .uid)
                                                .snapshots(),
                                            // FirebaseFirestore.instance
                                            //     .collection("publisher_database")
                                            //     .doc(FirebaseAuth
                                            //         .instance.currentUser!.uid)
                                            //     .collection("leads")
                                            //     .snapshots(),
                                            builder: (context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                              if (snapshot.hasError) {
                                                return Center(
                                                  child: Text(snapshot.error
                                                      .toString()),
                                                );
                                              }
                                              return ListView.separated(
                                                  itemCount: snapshot
                                                      .data!.docs.length,
                                                  separatorBuilder: (_, index) {
                                                    return SizedBox(
                                                      height: 20,
                                                    );
                                                  },
                                                  itemBuilder: (_, index) {
                                                    return Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index]
                                                                    ["name"],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      fontSize:
                                                                          17.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              Container(
                                                                width: 58,
                                                                height: 16,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: getColor(snapshot
                                                                          .data!
                                                                          .docs[index]
                                                                      [
                                                                      "status"]),
                                                                ),
                                                                child: Text(
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    "campaign_name"],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "In Process")
                                                                Text(
                                                                  "You will be updated soon",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF000000),
                                                                      ),
                                                                ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "Rejected")
                                                                Text(
                                                                  "Your lead has been rejected",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF000000),
                                                                      ),
                                                                ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "Success")
                                                                Text(
                                                                  '+${snapshot.data!.docs[index]["payout"].toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF2DDD4F),
                                                                      ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            }),
                                        //
                                        //
                                        //
                                        StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection("Leads")
                                                .where("publisher_id",
                                                    isEqualTo: FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .uid)
                                                .where("status",
                                                    isEqualTo: "In Process")
                                                .snapshots(),
                                            // FirebaseFirestore.instance
                                            //     .collection("publisher_database")
                                            //     .doc(FirebaseAuth
                                            //         .instance.currentUser!.uid)
                                            //     .collection("leads")
                                            //     .snapshots(),
                                            builder: (context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                              if (snapshot.hasError) {
                                                return Center(
                                                  child: Text(snapshot.error
                                                      .toString()),
                                                );
                                              }
                                              return ListView.separated(
                                                  itemCount: snapshot
                                                      .data!.docs.length,
                                                  separatorBuilder: (_, index) {
                                                    return SizedBox(
                                                      height: 20,
                                                    );
                                                  },
                                                  itemBuilder: (_, index) {
                                                    return Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index]
                                                                    ["name"],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      fontSize:
                                                                          17.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              Container(
                                                                width: 58,
                                                                height: 16,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: getColor(snapshot
                                                                          .data!
                                                                          .docs[index]
                                                                      [
                                                                      "status"]),
                                                                ),
                                                                child: Text(
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    "campaign_name"],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "In Process")
                                                                Text(
                                                                  "You will be updated soon",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF000000),
                                                                      ),
                                                                ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "Rejected")
                                                                Text(
                                                                  "Your lead has been rejected",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF000000),
                                                                      ),
                                                                ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "Success")
                                                                Text(
                                                                  '+${snapshot.data!.docs[index]["payout"].toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF2DDD4F),
                                                                      ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            }),
                                        //
                                        //
                                        //
                                        StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection("Leads")
                                                .where("publisher_id",
                                                    isEqualTo: FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .uid)
                                                .where("status",
                                                    isEqualTo: "Success")
                                                .snapshots(),
                                            // FirebaseFirestore.instance
                                            //     .collection("publisher_database")
                                            //     .doc(FirebaseAuth
                                            //         .instance.currentUser!.uid)
                                            //     .collection("leads")
                                            //     .snapshots(),
                                            builder: (context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                              if (snapshot.hasError) {
                                                return Center(
                                                  child: Text(snapshot.error
                                                      .toString()),
                                                );
                                              }
                                              return ListView.separated(
                                                  itemCount: snapshot
                                                      .data!.docs.length,
                                                  separatorBuilder: (_, index) {
                                                    return SizedBox(
                                                      height: 20,
                                                    );
                                                  },
                                                  itemBuilder: (_, index) {
                                                    return Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index]
                                                                    ["name"],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      fontSize:
                                                                          17.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              Container(
                                                                width: 58,
                                                                height: 16,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: getColor(snapshot
                                                                          .data!
                                                                          .docs[index]
                                                                      [
                                                                      "status"]),
                                                                ),
                                                                child: Text(
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    "campaign_name"],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "In Process")
                                                                Text(
                                                                  "You will be updated soon",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF000000),
                                                                      ),
                                                                ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "Rejected")
                                                                Text(
                                                                  "Your lead has been rejected",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF000000),
                                                                      ),
                                                                ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "Success")
                                                                Text(
                                                                  '+${snapshot.data!.docs[index]["payout"].toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF2DDD4F),
                                                                      ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            }),
                                        //
                                        //
                                        //
                                        StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection("Leads")
                                                .where("publisher_id",
                                                    isEqualTo: FirebaseAuth
                                                        .instance
                                                        .currentUser!
                                                        .uid)
                                                .where("status",
                                                    isEqualTo: "Rejected")
                                                .snapshots(),
                                            // FirebaseFirestore.instance
                                            //     .collection("publisher_database")
                                            //     .doc(FirebaseAuth
                                            //         .instance.currentUser!.uid)
                                            //     .collection("leads")
                                            //     .snapshots(),
                                            builder: (context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                );
                                              }
                                              if (snapshot.hasError) {
                                                return Center(
                                                  child: Text(snapshot.error
                                                      .toString()),
                                                );
                                              }
                                              return ListView.separated(
                                                  itemCount: snapshot
                                                      .data!.docs.length,
                                                  separatorBuilder: (_, index) {
                                                    return SizedBox(
                                                      height: 20,
                                                    );
                                                  },
                                                  itemBuilder: (_, index) {
                                                    return Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index]
                                                                    ["name"],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      fontSize:
                                                                          17.5,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              Container(
                                                                width: 58,
                                                                height: 16,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: getColor(snapshot
                                                                          .data!
                                                                          .docs[index]
                                                                      [
                                                                      "status"]),
                                                                ),
                                                                child: Text(
                                                                  snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"],
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        fontSize:
                                                                            10,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(20,
                                                                      0, 20, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                snapshot.data!
                                                                            .docs[
                                                                        index][
                                                                    "campaign_name"],
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Manrope',
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                              ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "In Process")
                                                                Text(
                                                                  "You will be updated soon",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF000000),
                                                                      ),
                                                                ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "Rejected")
                                                                Text(
                                                                  "Your lead has been rejected",
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontSize:
                                                                            10,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF000000),
                                                                      ),
                                                                ),
                                                              if (snapshot.data!
                                                                              .docs[
                                                                          index]
                                                                      [
                                                                      "status"] ==
                                                                  "Success")
                                                                Text(
                                                                  '+${snapshot.data!.docs[index]["payout"].toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Manrope',
                                                                        color: Color(
                                                                            0xFF2DDD4F),
                                                                      ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            }),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(12, 10, 10, 0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       FlutterFlowChoiceChips(
                          //         initiallySelected: [
                          //           if (choiceChipsValue3 != null)
                          //             choiceChipsValue3!
                          //         ],
                          //         options: [
                          //           ChipData(
                          //               FFLocalizations.of(context).getText(
                          //             '5plshm0l' /* Paytm */,
                          //           )),
                          //           ChipData(
                          //               FFLocalizations.of(context).getText(
                          //             'x51kets0' /* HDFC */,
                          //           )),
                          //           ChipData(
                          //               FFLocalizations.of(context).getText(
                          //             'w1q4z58e' /* Fi */,
                          //           )),
                          //           ChipData(
                          //               FFLocalizations.of(context).getText(
                          //             'fjg0jpuk' /* ICICI */,
                          //           )),
                          //           ChipData(
                          //               FFLocalizations.of(context).getText(
                          //             '1a3wh8xh' /* Bank Of Baroda */,
                          //           ))
                          //         ],
                          //         onChanged: (val) => setState(
                          //             () => choiceChipsValue3 = val?.first),
                          //         selectedChipStyle: ChipStyle(
                          //           backgroundColor: Color(0xFF323B45),
                          //           textStyle: FlutterFlowTheme.of(context)
                          //               .bodyText1
                          //               .override(
                          //                 fontFamily: 'Manrope',
                          //                 color: Colors.white,
                          //               ),
                          //           iconColor: Colors.white,
                          //           iconSize: 0,
                          //           elevation: 4,
                          //         ),
                          //         unselectedChipStyle: ChipStyle(
                          //           backgroundColor: Colors.white,
                          //           textStyle: FlutterFlowTheme.of(context)
                          //               .bodyText2
                          //               .override(
                          //                 fontFamily: 'Manrope',
                          //                 color: Color(0xFF323B45),
                          //                 fontSize: 10,
                          //               ),
                          //           iconColor: Color(0xFF323B45),
                          //           iconSize: 18,
                          //           elevation: 4,
                          //         ),
                          //         chipSpacing: 10,
                          //         multiselect: false,
                          //         alignment: WrapAlignment.center,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //     children: [
                          //       Container(
                          //         width: 275,
                          //         height: 38,
                          //         decoration: BoxDecoration(
                          //           color: FlutterFlowTheme.of(context)
                          //               .secondaryBackground,
                          //           borderRadius: BorderRadius.circular(7),
                          //         ),
                          //         child: Center(
                          //           child: TextFormField(
                          //             controller: textController,
                          //             obscureText: false,
                          //             decoration: InputDecoration(
                          //               hintText:
                          //                   FFLocalizations.of(context).getText(
                          //                 '8kuwkns5' /* Search */,
                          //               ),
                          //               hintStyle: FlutterFlowTheme.of(context)
                          //                   .bodyText2,
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
                          //               filled: true,
                          //               fillColor: Color(0x19307AFC),
                          //               contentPadding:
                          //                   EdgeInsetsDirectional.fromSTEB(
                          //                       0, 8, 0, 0),
                          //               prefixIcon: Icon(
                          //                 Icons.search,
                          //                 size: 16,
                          //               ),
                          //             ),
                          //             style: FlutterFlowTheme.of(context)
                          //                 .bodyText1
                          //                 .override(
                          //                   fontFamily: 'Manrope',
                          //                   fontWeight: FontWeight.bold,
                          //                 ),
                          //           ),
                          //         ),
                          //       ),
                          //       Container(
                          //         width: 24,
                          //         height: 24,
                          //         decoration: BoxDecoration(
                          //           color: FlutterFlowTheme.of(context)
                          //               .secondaryBackground,
                          //           image: DecorationImage(
                          //             fit: BoxFit.cover,
                          //             image: Image.asset(
                          //               'assets/images/Vector.png',
                          //             ).image,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(
                          //       20, 20, 0, 15),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       Align(
                          //         alignment:
                          //             AlignmentDirectional(-0.85, 0),
                          //         child: Text(
                          //           FFLocalizations.of(context)
                          //               .getText(
                          //             'fw2nne7k' /* Recent */,
                          //           ),
                          //           style:
                          //               FlutterFlowTheme.of(context)
                          //                   .bodyText1
                          //                   .override(
                          //                     fontFamily: 'Manrope',
                          //                     color:
                          //                         Color(0xFF858585),
                          //                   ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(
                            height: 30,
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
    );
  }
}
