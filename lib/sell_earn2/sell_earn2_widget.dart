import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infilate/components/seaa_widget.dart';
import 'package:infilate/index.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SellEarn2Widget extends StatefulWidget {
  final String category;
  const SellEarn2Widget({Key? key, required this.category}) : super(key: key);

  @override
  _SellEarn2WidgetState createState() => _SellEarn2WidgetState();
}

class _SellEarn2WidgetState extends State<SellEarn2Widget> {
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
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 22,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'dqb1egzb' /* Sell & Earn */,
          ),
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
      backgroundColor: Color(0xFF122139),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFF9FBFE),
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(25, 15, 25, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Text(
                              "Top ${widget.category}",
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: Color(0xFF868686),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("campaign_data")
                              .where("campaignType", isEqualTo: widget.category)
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            }
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (_, index) {
                                  if (snapshot.data!.docs.length == 0) {
                                    Text(
                                      "No Campaigns....",
                                      style: TextStyle(color: Colors.black),
                                    );
                                  }
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 20, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 124,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: InkWell(
                                              onTap: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          SellnearndetailWidget(
                                                            id: snapshot.data!
                                                                .docs[index].id,
                                                            name: snapshot.data!
                                                                    .docs[index]
                                                                [
                                                                "campaign_name"],
                                                            img: snapshot.data!
                                                                    .docs[index]
                                                                ["img"],
                                                            tnc: snapshot.data!
                                                                    .docs[index]
                                                                ["terms"],
                                                            pricing: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                [
                                                                "affiliate_pricing"],
                                                            details: snapshot
                                                                    .data!
                                                                    .docs[index]
                                                                [
                                                                "campaign_brief"],
                                                          ))),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Container(
                                                      width: 83,
                                                      height: 83,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                            snapshot.data!
                                                                    .docs[index]
                                                                ["img"],
                                                          ),
                                                          // Image.asset(
                                                          //   'assets/images/Group_184.png',
                                                          // ).image,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15, 6, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            snapshot.data!
                                                                    .docs[index]
                                                                [
                                                                "campaign_name"],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: Color(
                                                                      0xFF606060),
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      5, 0, 0),
                                                          child: SizedBox(
                                                            width: 200,
                                                            height: 30,
                                                            child: Text(
                                                              snapshot.data!
                                                                          .docs[
                                                                      index][
                                                                  "campaign_brief"],
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              textWidthBasis:
                                                                  TextWidthBasis
                                                                      .parent,
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Manrope',
                                                                    color: Color(
                                                                        0xFFA5A5A5),
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      5, 0, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 121,
                                                                height: 21,
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  // image:
                                                                  //     DecorationImage(
                                                                  //   fit: BoxFit.fill,
                                                                  //   image:
                                                                  //       Image.asset(
                                                                  //     'assets/images/Group_465.png',
                                                                  //   ).image,
                                                                  // ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              100),
                                                                ),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Image.asset(
                                                                      "assets/images/video.png",
                                                                      width: 14,
                                                                      height: 9,
                                                                    ),
                                                                    Text(
                                                                      "Watch Training Video",
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Manrope',
                                                                            color:
                                                                                Color(0xFF606060),
                                                                            fontSize:
                                                                                8,
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    Container(
                                                                  width: 69,
                                                                  height: 21,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: Image
                                                                          .asset(
                                                                        'assets/images/Group_466.png',
                                                                      ).image,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            100),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }),

                      // ListView(
                      //   padding: EdgeInsets.zero,
                      //   shrinkWrap: true,
                      //   scrollDirection: Axis.vertical,
                      //   children: [
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      //       child: Container(
                      //         width: 397,
                      //         height: 124,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //         ),
                      //         child: ListView(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.vertical,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 10, 0, 0),
                      //               child: InkWell(
                      //                 onTap: () => Navigator.push(
                      //                     context,
                      //                     MaterialPageRoute(
                      //                         builder: (_) =>
                      //                             SellnearndetailWidget())),
                      //                 child: Row(
                      //                   mainAxisSize: MainAxisSize.max,
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment.center,
                      //                   children: [
                      //                     Padding(
                      //                       padding:
                      //                           EdgeInsetsDirectional.fromSTEB(
                      //                               0, 10, 0, 0),
                      //                       child: Container(
                      //                         width: 83,
                      //                         height: 83,
                      //                         decoration: BoxDecoration(
                      //                           color: Colors.transparent,
                      //                           image: DecorationImage(
                      //                             fit: BoxFit.cover,
                      //                             image: Image.asset(
                      //                               'assets/images/Group_184.png',
                      //                             ).image,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     Padding(
                      //                       padding:
                      //                           EdgeInsetsDirectional.fromSTEB(
                      //                               15, 6, 0, 0),
                      //                       child: Column(
                      //                         mainAxisSize: MainAxisSize.max,
                      //                         crossAxisAlignment:
                      //                             CrossAxisAlignment.start,
                      //                         children: [
                      //                           Padding(
                      //                             padding: EdgeInsetsDirectional
                      //                                 .fromSTEB(2, 0, 0, 0),
                      //                             child: Text(
                      //                               FFLocalizations.of(context)
                      //                                   .getText(
                      //                                 '1y3pq6ar' /* Axis Bank Credit Card */,
                      //                               ),
                      //                               style: FlutterFlowTheme.of(
                      //                                       context)
                      //                                   .bodyText1
                      //                                   .override(
                      //                                     fontFamily: 'Manrope',
                      //                                     color:
                      //                                         Color(0xFF606060),
                      //                                     fontSize: 16,
                      //                                     fontWeight:
                      //                                         FontWeight.bold,
                      //                                   ),
                      //                             ),
                      //                           ),
                      //                           Padding(
                      //                             padding: EdgeInsetsDirectional
                      //                                 .fromSTEB(2, 5, 0, 0),
                      //                             child: Text(
                      //                               FFLocalizations.of(context)
                      //                                   .getText(
                      //                                 'qem71t53' /* Lorem ipsum dolor sit amet, co... */,
                      //                               ),
                      //                               style: FlutterFlowTheme.of(
                      //                                       context)
                      //                                   .bodyText1
                      //                                   .override(
                      //                                     fontFamily: 'Manrope',
                      //                                     color:
                      //                                         Color(0xFFA5A5A5),
                      //                                     fontSize: 8,
                      //                                     fontWeight:
                      //                                         FontWeight.normal,
                      //                                   ),
                      //                             ),
                      //                           ),
                      //                           Padding(
                      //                             padding: EdgeInsetsDirectional
                      //                                 .fromSTEB(0, 5, 0, 0),
                      //                             child: Row(
                      //                               mainAxisSize:
                      //                                   MainAxisSize.max,
                      //                               children: [
                      //                                 Container(
                      //                                   width: 121,
                      //                                   height: 21,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .secondaryBackground,
                      //                                     image:
                      //                                         DecorationImage(
                      //                                       fit: BoxFit.fill,
                      //                                       image: Image.asset(
                      //                                         'assets/images/Group_465.png',
                      //                                       ).image,
                      //                                     ),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(
                      //                                                 100),
                      //                                   ),
                      //                                 ),
                      //                                 Padding(
                      //                                   padding:
                      //                                       EdgeInsetsDirectional
                      //                                           .fromSTEB(10, 0,
                      //                                               0, 0),
                      //                                   child: Container(
                      //                                     width: 69,
                      //                                     height: 21,
                      //                                     decoration:
                      //                                         BoxDecoration(
                      //                                       color: FlutterFlowTheme
                      //                                               .of(context)
                      //                                           .secondaryBackground,
                      //                                       image:
                      //                                           DecorationImage(
                      //                                         fit: BoxFit.cover,
                      //                                         image:
                      //                                             Image.asset(
                      //                                           'assets/images/Group_466.png',
                      //                                         ).image,
                      //                                       ),
                      //                                       borderRadius:
                      //                                           BorderRadius
                      //                                               .circular(
                      //                                                   100),
                      //                                     ),
                      //                                   ),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      //       child: Container(
                      //         width: 397,
                      //         height: 124,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //         ),
                      //         child: ListView(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.vertical,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 10, 0, 0),
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             8, 10, 0, 0),
                      //                     child: Container(
                      //                       width: 83,
                      //                       height: 83,
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.transparent,
                      //                         image: DecorationImage(
                      //                           fit: BoxFit.cover,
                      //                           image: Image.asset(
                      //                             'assets/images/Group_184_(1).png',
                      //                           ).image,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             15, 6, 0, 0),
                      //                     child: Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 0, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'y8ktbw8j' /* Bank of Baroda Credit Card */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFF606060),
                      //                                   fontSize: 16,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 5, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'kl9zb1r1' /* Lorem ipsum dolor sit amet, co... */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFFA5A5A5),
                      //                                   fontSize: 8,
                      //                                   fontWeight:
                      //                                       FontWeight.normal,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(0, 5, 0, 0),
                      //                           child: Row(
                      //                             mainAxisSize:
                      //                                 MainAxisSize.max,
                      //                             children: [
                      //                               Container(
                      //                                 width: 121,
                      //                                 height: 21,
                      //                                 decoration: BoxDecoration(
                      //                                   color: FlutterFlowTheme
                      //                                           .of(context)
                      //                                       .secondaryBackground,
                      //                                   image: DecorationImage(
                      //                                     fit: BoxFit.fill,
                      //                                     image: Image.asset(
                      //                                       'assets/images/Group_465.png',
                      //                                     ).image,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(100),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     EdgeInsetsDirectional
                      //                                         .fromSTEB(
                      //                                             10, 0, 0, 0),
                      //                                 child: Container(
                      //                                   width: 69,
                      //                                   height: 21,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .secondaryBackground,
                      //                                     image:
                      //                                         DecorationImage(
                      //                                       fit: BoxFit.cover,
                      //                                       image: Image.asset(
                      //                                         'assets/images/Group_466.png',
                      //                                       ).image,
                      //                                     ),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(
                      //                                                 100),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      //       child: Container(
                      //         width: 397,
                      //         height: 124,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //         ),
                      //         child: ListView(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.vertical,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 10, 0, 0),
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             0, 10, 0, 0),
                      //                     child: Container(
                      //                       width: 83,
                      //                       height: 83,
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.transparent,
                      //                         image: DecorationImage(
                      //                           fit: BoxFit.cover,
                      //                           image: Image.asset(
                      //                             'assets/images/Group_184_(2).png',
                      //                           ).image,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             15, 6, 0, 0),
                      //                     child: Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 0, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               '39ppmpji' /* Kotak 811 Credit Bank */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFF606060),
                      //                                   fontSize: 16,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 5, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               '7rd6dkat' /* Lorem ipsum dolor sit amet, co... */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFFA5A5A5),
                      //                                   fontSize: 8,
                      //                                   fontWeight:
                      //                                       FontWeight.normal,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(0, 5, 0, 0),
                      //                           child: Row(
                      //                             mainAxisSize:
                      //                                 MainAxisSize.max,
                      //                             children: [
                      //                               Container(
                      //                                 width: 121,
                      //                                 height: 21,
                      //                                 decoration: BoxDecoration(
                      //                                   color: FlutterFlowTheme
                      //                                           .of(context)
                      //                                       .secondaryBackground,
                      //                                   image: DecorationImage(
                      //                                     fit: BoxFit.fill,
                      //                                     image: Image.asset(
                      //                                       'assets/images/Group_465.png',
                      //                                     ).image,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(100),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     EdgeInsetsDirectional
                      //                                         .fromSTEB(
                      //                                             10, 0, 0, 0),
                      //                                 child: Container(
                      //                                   width: 69,
                      //                                   height: 21,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .secondaryBackground,
                      //                                     image:
                      //                                         DecorationImage(
                      //                                       fit: BoxFit.cover,
                      //                                       image: Image.asset(
                      //                                         'assets/images/Group_466.png',
                      //                                       ).image,
                      //                                     ),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(
                      //                                                 100),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      //       child: Container(
                      //         width: 397,
                      //         height: 124,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //         ),
                      //         child: ListView(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.vertical,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 10, 0, 0),
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             0, 10, 0, 0),
                      //                     child: Container(
                      //                       width: 83,
                      //                       height: 83,
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.transparent,
                      //                         image: DecorationImage(
                      //                           fit: BoxFit.cover,
                      //                           image: Image.asset(
                      //                             'assets/images/Group_184_(3).png',
                      //                           ).image,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             15, 6, 0, 0),
                      //                     child: Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 0, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'mcc9gpq2' /* SBI Credit Card */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFF606060),
                      //                                   fontSize: 16,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 5, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'huetk5a1' /* Lorem ipsum dolor sit amet, co... */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFFA5A5A5),
                      //                                   fontSize: 8,
                      //                                   fontWeight:
                      //                                       FontWeight.normal,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(0, 5, 0, 0),
                      //                           child: Row(
                      //                             mainAxisSize:
                      //                                 MainAxisSize.max,
                      //                             children: [
                      //                               Container(
                      //                                 width: 121,
                      //                                 height: 21,
                      //                                 decoration: BoxDecoration(
                      //                                   color: FlutterFlowTheme
                      //                                           .of(context)
                      //                                       .secondaryBackground,
                      //                                   image: DecorationImage(
                      //                                     fit: BoxFit.fill,
                      //                                     image: Image.asset(
                      //                                       'assets/images/Group_465.png',
                      //                                     ).image,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(100),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     EdgeInsetsDirectional
                      //                                         .fromSTEB(
                      //                                             10, 0, 0, 0),
                      //                                 child: Container(
                      //                                   width: 69,
                      //                                   height: 21,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .secondaryBackground,
                      //                                     image:
                      //                                         DecorationImage(
                      //                                       fit: BoxFit.cover,
                      //                                       image: Image.asset(
                      //                                         'assets/images/Group_466.png',
                      //                                       ).image,
                      //                                     ),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(
                      //                                                 100),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      //       child: Container(
                      //         width: 397,
                      //         height: 124,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //         ),
                      //         child: ListView(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.vertical,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 10, 0, 0),
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             0, 10, 0, 0),
                      //                     child: Container(
                      //                       width: 83,
                      //                       height: 83,
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.transparent,
                      //                         image: DecorationImage(
                      //                           fit: BoxFit.cover,
                      //                           image: Image.asset(
                      //                             'assets/images/Group_184_(4).png',
                      //                           ).image,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             15, 6, 0, 0),
                      //                     child: Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 0, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'lhhssbfo' /* Bajaj EMI Credit Bank */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFF606060),
                      //                                   fontSize: 16,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 5, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'qxd6lgxc' /* Lorem ipsum dolor sit amet, co... */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFFA5A5A5),
                      //                                   fontSize: 8,
                      //                                   fontWeight:
                      //                                       FontWeight.normal,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(0, 5, 0, 0),
                      //                           child: Row(
                      //                             mainAxisSize:
                      //                                 MainAxisSize.max,
                      //                             children: [
                      //                               Container(
                      //                                 width: 121,
                      //                                 height: 21,
                      //                                 decoration: BoxDecoration(
                      //                                   color: FlutterFlowTheme
                      //                                           .of(context)
                      //                                       .secondaryBackground,
                      //                                   image: DecorationImage(
                      //                                     fit: BoxFit.fill,
                      //                                     image: Image.asset(
                      //                                       'assets/images/Group_465.png',
                      //                                     ).image,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(100),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     EdgeInsetsDirectional
                      //                                         .fromSTEB(
                      //                                             10, 0, 0, 0),
                      //                                 child: Container(
                      //                                   width: 69,
                      //                                   height: 21,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .secondaryBackground,
                      //                                     image:
                      //                                         DecorationImage(
                      //                                       fit: BoxFit.cover,
                      //                                       image: Image.asset(
                      //                                         'assets/images/Group_466.png',
                      //                                       ).image,
                      //                                     ),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(
                      //                                                 100),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      //       child: Container(
                      //         width: 397,
                      //         height: 124,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //         ),
                      //         child: ListView(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.vertical,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 10, 0, 0),
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             0, 10, 0, 0),
                      //                     child: Container(
                      //                       width: 83,
                      //                       height: 83,
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.transparent,
                      //                         image: DecorationImage(
                      //                           fit: BoxFit.cover,
                      //                           image: Image.asset(
                      //                             'assets/images/Group_184_(5).png',
                      //                           ).image,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             15, 6, 0, 0),
                      //                     child: Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 0, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'dxp2vy8z' /* ICICI Credit Card */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFF606060),
                      //                                   fontSize: 16,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 5, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               '0o9qdq0i' /* Lorem ipsum dolor sit amet, co... */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFFA5A5A5),
                      //                                   fontSize: 8,
                      //                                   fontWeight:
                      //                                       FontWeight.normal,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(0, 5, 0, 0),
                      //                           child: Row(
                      //                             mainAxisSize:
                      //                                 MainAxisSize.max,
                      //                             children: [
                      //                               Container(
                      //                                 width: 121,
                      //                                 height: 21,
                      //                                 decoration: BoxDecoration(
                      //                                   color: FlutterFlowTheme
                      //                                           .of(context)
                      //                                       .secondaryBackground,
                      //                                   image: DecorationImage(
                      //                                     fit: BoxFit.fill,
                      //                                     image: Image.asset(
                      //                                       'assets/images/Group_465.png',
                      //                                     ).image,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(100),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     EdgeInsetsDirectional
                      //                                         .fromSTEB(
                      //                                             10, 0, 0, 0),
                      //                                 child: Container(
                      //                                   width: 69,
                      //                                   height: 21,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .secondaryBackground,
                      //                                     image:
                      //                                         DecorationImage(
                      //                                       fit: BoxFit.cover,
                      //                                       image: Image.asset(
                      //                                         'assets/images/Group_466.png',
                      //                                       ).image,
                      //                                     ),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(
                      //                                                 100),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      //       child: Container(
                      //         width: 397,
                      //         height: 124,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //         ),
                      //         child: ListView(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.vertical,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 10, 0, 0),
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             0, 10, 0, 0),
                      //                     child: Container(
                      //                       width: 83,
                      //                       height: 83,
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.transparent,
                      //                         image: DecorationImage(
                      //                           fit: BoxFit.cover,
                      //                           image: Image.asset(
                      //                             'assets/images/Group_184_(6).png',
                      //                           ).image,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             15, 6, 0, 0),
                      //                     child: Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 0, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'r7ir2i7v' /* HDFC bank Credit Card */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFF606060),
                      //                                   fontSize: 16,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 5, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'pus8nbp6' /* Lorem ipsum dolor sit amet, co... */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFFA5A5A5),
                      //                                   fontSize: 8,
                      //                                   fontWeight:
                      //                                       FontWeight.normal,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(0, 5, 0, 0),
                      //                           child: Row(
                      //                             mainAxisSize:
                      //                                 MainAxisSize.max,
                      //                             children: [
                      //                               Container(
                      //                                 width: 121,
                      //                                 height: 21,
                      //                                 decoration: BoxDecoration(
                      //                                   color: FlutterFlowTheme
                      //                                           .of(context)
                      //                                       .secondaryBackground,
                      //                                   image: DecorationImage(
                      //                                     fit: BoxFit.fill,
                      //                                     image: Image.asset(
                      //                                       'assets/images/Group_465.png',
                      //                                     ).image,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(100),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     EdgeInsetsDirectional
                      //                                         .fromSTEB(
                      //                                             10, 0, 0, 0),
                      //                                 child: Container(
                      //                                   width: 69,
                      //                                   height: 21,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .secondaryBackground,
                      //                                     image:
                      //                                         DecorationImage(
                      //                                       fit: BoxFit.cover,
                      //                                       image: Image.asset(
                      //                                         'assets/images/Group_466.png',
                      //                                       ).image,
                      //                                     ),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(
                      //                                                 100),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      //       child: Container(
                      //         width: 397,
                      //         height: 124,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //         ),
                      //         child: ListView(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.vertical,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 10, 0, 0),
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             0, 10, 0, 0),
                      //                     child: Container(
                      //                       width: 83,
                      //                       height: 83,
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.transparent,
                      //                         image: DecorationImage(
                      //                           fit: BoxFit.cover,
                      //                           image: Image.asset(
                      //                             'assets/images/Group_184_(7).png',
                      //                           ).image,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             15, 6, 0, 0),
                      //                     child: Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 0, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'vfdnrnp5' /* Frist IDFC Bank Cerdit Card */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFF606060),
                      //                                   fontSize: 16,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 5, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'wvrz8tc6' /* Lorem ipsum dolor sit amet, co... */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFFA5A5A5),
                      //                                   fontSize: 8,
                      //                                   fontWeight:
                      //                                       FontWeight.normal,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(0, 5, 0, 0),
                      //                           child: Row(
                      //                             mainAxisSize:
                      //                                 MainAxisSize.max,
                      //                             children: [
                      //                               Container(
                      //                                 width: 121,
                      //                                 height: 21,
                      //                                 decoration: BoxDecoration(
                      //                                   color: FlutterFlowTheme
                      //                                           .of(context)
                      //                                       .secondaryBackground,
                      //                                   image: DecorationImage(
                      //                                     fit: BoxFit.fill,
                      //                                     image: Image.asset(
                      //                                       'assets/images/Group_465.png',
                      //                                     ).image,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(100),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     EdgeInsetsDirectional
                      //                                         .fromSTEB(
                      //                                             10, 0, 0, 0),
                      //                                 child: Container(
                      //                                   width: 69,
                      //                                   height: 21,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .secondaryBackground,
                      //                                     image:
                      //                                         DecorationImage(
                      //                                       fit: BoxFit.cover,
                      //                                       image: Image.asset(
                      //                                         'assets/images/Group_466.png',
                      //                                       ).image,
                      //                                     ),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(
                      //                                                 100),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      //       child: Container(
                      //         width: 397,
                      //         height: 124,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //         ),
                      //         child: ListView(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.vertical,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 10, 0, 0),
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             0, 10, 0, 0),
                      //                     child: Container(
                      //                       width: 83,
                      //                       height: 83,
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.transparent,
                      //                         image: DecorationImage(
                      //                           fit: BoxFit.cover,
                      //                           image: Image.asset(
                      //                             'assets/images/Group_184_(8).png',
                      //                           ).image,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             15, 6, 0, 0),
                      //                     child: Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 0, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               '6v13wdrg' /* Fi Credit Card */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFF606060),
                      //                                   fontSize: 16,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 5, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               't313fffh' /* Lorem ipsum dolor sit amet, co... */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFFA5A5A5),
                      //                                   fontSize: 8,
                      //                                   fontWeight:
                      //                                       FontWeight.normal,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(0, 5, 0, 0),
                      //                           child: Row(
                      //                             mainAxisSize:
                      //                                 MainAxisSize.max,
                      //                             children: [
                      //                               Container(
                      //                                 width: 121,
                      //                                 height: 21,
                      //                                 decoration: BoxDecoration(
                      //                                   color: FlutterFlowTheme
                      //                                           .of(context)
                      //                                       .secondaryBackground,
                      //                                   image: DecorationImage(
                      //                                     fit: BoxFit.fill,
                      //                                     image: Image.asset(
                      //                                       'assets/images/Group_465.png',
                      //                                     ).image,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(100),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     EdgeInsetsDirectional
                      //                                         .fromSTEB(
                      //                                             10, 0, 0, 0),
                      //                                 child: Container(
                      //                                   width: 69,
                      //                                   height: 21,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .secondaryBackground,
                      //                                     image:
                      //                                         DecorationImage(
                      //                                       fit: BoxFit.cover,
                      //                                       image: Image.asset(
                      //                                         'assets/images/Group_466.png',
                      //                                       ).image,
                      //                                     ),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(
                      //                                                 100),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding:
                      //           EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      //       child: Container(
                      //         width: 397,
                      //         height: 124,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //         ),
                      //         child: ListView(
                      //           padding: EdgeInsets.zero,
                      //           scrollDirection: Axis.vertical,
                      //           children: [
                      //             Padding(
                      //               padding: EdgeInsetsDirectional.fromSTEB(
                      //                   0, 10, 0, 0),
                      //               child: Row(
                      //                 mainAxisSize: MainAxisSize.max,
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.center,
                      //                 children: [
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             0, 10, 0, 0),
                      //                     child: Container(
                      //                       width: 83,
                      //                       height: 83,
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.transparent,
                      //                         image: DecorationImage(
                      //                           fit: BoxFit.cover,
                      //                           image: Image.asset(
                      //                             'assets/images/Group_184_(9).png',
                      //                           ).image,
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding:
                      //                         EdgeInsetsDirectional.fromSTEB(
                      //                             15, 6, 0, 0),
                      //                     child: Column(
                      //                       mainAxisSize: MainAxisSize.max,
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 0, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'q35lhumv' /* Slice Credit Card */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFF606060),
                      //                                   fontSize: 16,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(2, 5, 0, 0),
                      //                           child: Text(
                      //                             FFLocalizations.of(context)
                      //                                 .getText(
                      //                               'tr5defnz' /* Lorem ipsum dolor sit amet, co... */,
                      //                             ),
                      //                             style: FlutterFlowTheme.of(
                      //                                     context)
                      //                                 .bodyText1
                      //                                 .override(
                      //                                   fontFamily: 'Manrope',
                      //                                   color:
                      //                                       Color(0xFFA5A5A5),
                      //                                   fontSize: 8,
                      //                                   fontWeight:
                      //                                       FontWeight.normal,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Padding(
                      //                           padding: EdgeInsetsDirectional
                      //                               .fromSTEB(0, 5, 0, 0),
                      //                           child: Row(
                      //                             mainAxisSize:
                      //                                 MainAxisSize.max,
                      //                             children: [
                      //                               Container(
                      //                                 width: 121,
                      //                                 height: 21,
                      //                                 decoration: BoxDecoration(
                      //                                   color: FlutterFlowTheme
                      //                                           .of(context)
                      //                                       .secondaryBackground,
                      //                                   image: DecorationImage(
                      //                                     fit: BoxFit.fill,
                      //                                     image: Image.asset(
                      //                                       'assets/images/Group_465.png',
                      //                                     ).image,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(100),
                      //                                 ),
                      //                               ),
                      //                               Padding(
                      //                                 padding:
                      //                                     EdgeInsetsDirectional
                      //                                         .fromSTEB(
                      //                                             10, 0, 0, 0),
                      //                                 child: Container(
                      //                                   width: 69,
                      //                                   height: 21,
                      //                                   decoration:
                      //                                       BoxDecoration(
                      //                                     color: FlutterFlowTheme
                      //                                             .of(context)
                      //                                         .secondaryBackground,
                      //                                     image:
                      //                                         DecorationImage(
                      //                                       fit: BoxFit.cover,
                      //                                       image: Image.asset(
                      //                                         'assets/images/Group_466.png',
                      //                                       ).image,
                      //                                     ),
                      //                                     borderRadius:
                      //                                         BorderRadius
                      //                                             .circular(
                      //                                                 100),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
