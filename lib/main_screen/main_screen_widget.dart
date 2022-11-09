import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:infilate/components/bottomnavbar.dart';
import 'package:infilate/constants.dart';
import 'package:infilate/index.dart';
import 'package:infilate/notifications_page.dart';
import 'package:infilate/switch_screen.dart';
import 'package:infilate/visting_card/visiting_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components/brand_items.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../traning/training.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  String? userName;
  PageController? pageViewController;
  double? ratingBarValue1;
  double? ratingBarValue2;
  String? switchType;
  String? walletAmt;
  String totalLeads = "0";
  String inprocessLeads = "0";
  String completedLeads = "0";
  // int currentindex = 2;
  // final screens = [
  //   MainScreenWidget(),
  //   ManageleadWidget(),
  //   SwitchScreen(),
  //   ReferAndEarnWidget(),
  //   Training(),
  // ];
  final scaffoldKey = GlobalKey<ScaffoldState>();

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

  Future getUserData() async {
    try {
      final userData = await FirebaseFirestore.instance
          .collection("publisher_database")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      print(userData['username']);
      print("---------------------------------");

      setState(() {
        if (userData.exists) {
          userName = userData['username'];
          walletAmt = userData['hold'].toString();
        }
      });
    } catch (e) {
      // Fluttertoast.showToast(
      //     msg: "Error while fetching details", backgroundColor: Colors.red);
      print("error while fetching details");
    }

    // setState(() {
    //   // userData['name'] = userName;
    //   if (!userData.exists) {
    //     userName = "";
    //   } else {
    //     userName = userData['name'];
    //   }
    // });
  }

  Future getSwitch() async {
    final prefs = await SharedPreferences.getInstance();

    final value = prefs.getString("switch");
    print(value);

    setState(() {
      switchType = value;
    });
  }

  @override
  void initState() {
    getUserData();
    getSwitch();
    getLeadsInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: light,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.menu,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ProfileWidget()));
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Text(
            //   FFLocalizations.of(context).getText(
            //     '2wx7bhps' /* Hello, */,
            //   ),
            //   style: FlutterFlowTheme.of(context).bodyText1,
            // ),
            // Text(
            //   FFLocalizations.of(context).getText(
            //     'ovh0gizv' /* Yash!  */,
            //   ),
            //   style: FlutterFlowTheme.of(context).bodyText1,
            // ),
            RichText(
              text: TextSpan(
                text: "Hello, ",
                style: GoogleFonts.chivo(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: title,
                ),
                children: [
                  TextSpan(
                    text: userName ?? '',
                    style: GoogleFonts.chivo(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: title,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
              child: Container(
                padding: EdgeInsets.all(4),
                // width: 35.8,
                // height: 11.2,
                decoration: BoxDecoration(
                  color: Color(0xFF6FDD84),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    switchType ?? "Affilate",
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Manrope',
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 40,
            icon:
                // Image.asset(
                //   "assets/images/wallet-icon.png",
                //   height: 20,
                //   width: 24,
                //   color: icon,
                // ),
                ImageIcon(
              AssetImage("assets/images/wallet-icon.png"),
              size: 28,
              color: icon,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => WalletWidget()));
            },
          ),
          FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 40,
            icon: ImageIcon(
              AssetImage("assets/images/comment-icon.png"),
              size: 26,
              color: icon,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SupportWidget()));
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 40,
              icon: ImageIcon(
                AssetImage("assets/images/notification-icon.png"),
                size: 26,
                color: icon,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => NotificationsPage()));
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: light,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(),
                      child: PageView(
                        // padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Color(0xFF012139),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Rectangle_167.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 0, 0),
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: Image.asset(
                                                'assets/images/Ellipse_41.png',
                                              ).image,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                color: Color(0x41040000),
                                                offset: Offset(0, 4),
                                                spreadRadius: 0,
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30,
                                            borderWidth: 1,
                                            buttonSize: 60,
                                            icon: ImageIcon(
                                              AssetImage(
                                                  "assets/images/wallet-icon.png"),
                                              size: 28,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '690a8txe' /* Available Balance */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      ),
                                            ),
                                            Text(
                                              walletAmt ?? "0",
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: lightText,
                                                        fontSize: 40,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.27,
                                          height: 37,
                                          decoration: BoxDecoration(
                                            // image: DecorationImage(
                                            //   fit: BoxFit.cover,
                                            //   image: Image.asset(
                                            //     'assets/images/Rectangle.png',
                                            //   ).image,
                                            // ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF3F3F7F),
                                                Color(0xFF011C30),
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          SellEarnWidget()));
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'y8esvdau' /* Add Lead */,
                                            ),
                                            icon: Icon(
                                              Icons.add,
                                              size: 12,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 40,
                                              color: Colors.transparent,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Color(0x25FFFFFF),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 5, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'e783uiim' /* ₹ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Manrope',
                                                color: Color(0xFFB9F7CE),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w800,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 20, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '31owcit1' /* Paid Earning */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            Text(
                                              "0",
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0x25E8EDF3),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'zofhzris' /* ₹ */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Manrope',
                                                color: Color(0xFFFEBEC7),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w800,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mmirbshk' /* Pending Earning */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                            Text(
                                              "0",
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFF012139),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Rectangle_167.png',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Container(
                                          width: 155,
                                          height: 51,
                                          // decoration: BoxDecoration(
                                          //   image: DecorationImage(
                                          //     fit: BoxFit.fill,
                                          //     image: Image.asset(
                                          //       'assets/images/Rectangle_(1).png',
                                          //     ).image,
                                          //   ),
                                          //   boxShadow: [
                                          //     BoxShadow(
                                          //       blurRadius: 3,
                                          //       color: Color(0x26FFFFFF),
                                          //       offset: Offset(-2, -2),
                                          //     )
                                          //   ],
                                          // ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 5, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  totalLeads,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            Color(0xFFCAF7FD),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 10),
                                                  child: Container(
                                                    width: 1,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x1BFFFFFF),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '6bq78k07' /* Total Leads */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            Color(0xFFD7E1EF),
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.27,
                                          height: 37,
                                          decoration: BoxDecoration(
                                            // image: DecorationImage(
                                            //   fit: BoxFit.cover,
                                            //   image: Image.asset(
                                            //     'assets/images/Rectangle.png',
                                            //   ).image,
                                            // ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Color(0xFF3F3F7F),
                                                Color(0xFF011C30),
                                              ],
                                            ),

                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: FFButtonWidget(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          SellEarnWidget()));
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'y8esvdau' /* Add Lead */,
                                            ),
                                            icon: Icon(
                                              Icons.add,
                                              size: 12,
                                            ),
                                            options: FFButtonOptions(
                                              width: 130,
                                              height: 40,
                                              color: Colors.transparent,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color: Colors.white,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 1,
                                    color: Color(0x25FFFFFF),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 104,
                                        height: 34,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: Image.asset(
                                              'assets/images/Rectangle_(1).png',
                                            ).image,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x26FFFFFF),
                                              offset: Offset(-2, -2),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 5, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                inprocessLeads,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color:
                                                              Color(0xFFEE9277),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Container(
                                                  width: 1,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x1BFFFFFF),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '03kx3rqb' /* Leads in Process */
                                                    ,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            Color(0xFFD7E1EF),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: Container(
                                          width: 1,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Color(0x25E8EDF3),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 104,
                                        height: 34,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: Image.asset(
                                              'assets/images/Rectangle_(1).png',
                                            ).image,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 3,
                                              color: Color(0x26FFFFFF),
                                              offset: Offset(-2, -2),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 5, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                completedLeads,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Manrope',
                                                          color:
                                                              Color(0xFF63DD7B),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 10, 0, 10),
                                                child: Container(
                                                  width: 1,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x1BFFFFFF),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 0, 0, 0),
                                                child: Text(
                                                  "Leads\nCompleted",
                                                  // textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            Color(0xFFD7E1EF),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Stack(
                        alignment: AlignmentDirectional(-1, 0),
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            VoucherRewardsWidget()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height: 47,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF5D9EEB),
                                      Color(0xFF0038FF)
                                    ],
                                    stops: [0, 1],
                                    begin: AlignmentDirectional(-1, 0),
                                    end: AlignmentDirectional(1, 0),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'ki0jxole' /* Complete Your Daily Challenges... */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40, 0, 10, 0),
                                        child: Container(
                                          height: 20,
                                          width: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: title,
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.16,
                              height: MediaQuery.of(context).size.width * 0.16,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Lottie.asset(
                                'assets/lottie_animations/23227-coin-flip-rupee.json',
                                width: 150,
                                height: 130,
                                fit: BoxFit.cover,
                                animate: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 2.3,
                      decoration: BoxDecoration(
                        // color: FlutterFlowTheme.of(context).secondaryBackground,
                        color: Color(0xFFF9FBFE),
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
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 10),
                            child: Container(
                              width: 50,
                              height: 4,
                              decoration: BoxDecoration(
                                // color: Color(0xFFF9FBFE),
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'xo87eubl' /* Get Started with training Vide... */,
                                  ),
                                  style: GoogleFonts.manrope(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF01213A),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: 51,
                                    height: 13,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFFD932),
                                      borderRadius: BorderRadius.circular(1000),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'nqlzt6ba' /* 30:00 Left */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Manrope',
                                              fontSize: 7.5,
                                              fontWeight: FontWeight.w800,
                                              // lineHeight: 10.25,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: FlutterFlowYoutubePlayer(
                                    url:
                                        'https://www.youtube.com/watch?v=C30hQ0ZSFoM',
                                    autoPlay: false,
                                    looping: true,
                                    mute: false,
                                    showControls: true,
                                    showFullScreen: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: FlutterFlowYoutubePlayer(
                                    url:
                                        'https://www.youtube.com/watch?v=C30hQ0ZSFoM',
                                    autoPlay: false,
                                    looping: true,
                                    mute: false,
                                    showControls: true,
                                    showFullScreen: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: FlutterFlowYoutubePlayer(
                                    url:
                                        'https://www.youtube.com/watch?v=C30hQ0ZSFoM',
                                    autoPlay: false,
                                    looping: true,
                                    mute: false,
                                    showControls: true,
                                    showFullScreen: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: FlutterFlowYoutubePlayer(
                                    url:
                                        'https://www.youtube.com/watch?v=C30hQ0ZSFoM',
                                    autoPlay: false,
                                    looping: true,
                                    mute: false,
                                    showControls: true,
                                    showFullScreen: true,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Align(
                          //   alignment: AlignmentDirectional(-1, 0),
                          //   child: Padding(
                          //     padding: EdgeInsetsDirectional.fromSTEB(
                          //         15, 10, 15, 10),
                          //     child: Text(
                          //       FFLocalizations.of(context).getText(
                          //         'flf84yn1' /* Top Selling Brands */,
                          //       ),
                          //       style: FlutterFlowTheme.of(context)
                          //           .bodyText1
                          //           .override(
                          //             fontFamily: 'Manrope',
                          //             fontWeight: FontWeight.w700,
                          //             fontSize: 13.5,
                          //           ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Color(0xFFE8F9FC),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 12,
                              ),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0xFF599BFF),
                                  borderRadius: BorderRadius.circular(11),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                      height: 275,
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 10, 15, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'flf84yn1' /* Top Selling Brands */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 13.5,
                                                      ),
                                                ),
                                                Text(
                                                  "New Latest",
                                                  style: GoogleFonts.manrope(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11.5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: StreamBuilder(
                                              stream: FirebaseFirestore.instance
                                                  .collection("campaign_data")
                                                  .snapshots(),
                                              builder: (BuildContext context,
                                                  AsyncSnapshot<QuerySnapshot>
                                                      snapshot) {
                                                // if (snapshot.data.docs.lenght) {
                                                //   return Center(
                                                //     child:
                                                //         Text("No camapaigns.."),
                                                //   );
                                                // }
                                                if (snapshot.hasError) {
                                                  print(snapshot.error);
                                                  return Center(
                                                    child: Text(
                                                        "Something went wrong!"),
                                                  );
                                                } else if (!snapshot.hasData) {
                                                  return Center(
                                                    child: Text(
                                                        "No campaigns available"),
                                                  );
                                                } else if (snapshot
                                                        .connectionState ==
                                                    ConnectionState.waiting) {
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                } else {
                                                  return GridView.builder(
                                                    itemCount: snapshot
                                                        .data!.docs.length,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10,
                                                    ),
                                                    gridDelegate:
                                                        SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3,
                                                      mainAxisSpacing: 10,
                                                      crossAxisSpacing: 10,
                                                    ),
                                                    itemBuilder:
                                                        (context, index) {
                                                      // if()
                                                      // print(
                                                      //   snapshot
                                                      //       .data.docs[9].id,
                                                      // );

                                                      return BrandItem(
                                                        id: snapshot.data!
                                                            .docs[index].id,
                                                        image: snapshot.data!
                                                            .docs[index]["img"],
                                                        label: snapshot.data!
                                                                .docs[index]
                                                            ["campaign_name"],
                                                        details: snapshot.data!
                                                                .docs[index]
                                                            ["campaign_brief"],
                                                        pricing: snapshot
                                                            .data!
                                                            .docs[index][
                                                                "affiliate_pricing"]
                                                            .toString(),
                                                        tnc: snapshot.data!
                                                                .docs[index]
                                                            ["terms"],
                                                      );
                                                      // return BrandItem(
                                                      //   image:
                                                      //       "assets/images/Done!.png",
                                                      //   label: "done",
                                                      // );
                                                    },
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 8,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Earn Upto ₹500 over 3000+ brands',
                                            style: GoogleFonts.manrope(
                                              color: white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          SellEarnWidget()));
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  "more",
                                                  style: GoogleFonts.manrope(
                                                    color: white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Image.asset(
                                                  "assets/images/more-icon-white.png",
                                                  height: 12,
                                                  width: 12,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'syez0b39' /* Sell and Earn */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                        color: Color(0xFF011F36),
                                      ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Row(
                                    //   children: [
                                    //     Text(
                                    //       "more",
                                    //       style: GoogleFonts.manrope(
                                    //         color: Color(0xFF01213A),
                                    //         fontWeight: FontWeight.w600,
                                    //         fontSize: 12,
                                    //       ),
                                    //     ),
                                    //     SizedBox(
                                    //       width: 2,
                                    //     ),
                                    //     Image.asset(
                                    //       "assets/images/more-icon.png",
                                    //       height: 12,
                                    //       width: 12,
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.27,
                              child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection("Category")
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: Text("No data"),
                                    );
                                  }
                                  return GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (_, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => SellEarn2Widget(
                                                category:
                                                    snapshot.data!.docs[index]
                                                        ["categoryTitle"],
                                              ),
                                            ),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 67,
                                              height: 67,
                                              padding: EdgeInsets.all(
                                                10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: Color(0xFFE7E7E7),
                                                ),
                                              ),
                                              child: Center(
                                                child: Image.network(
                                                  snapshot.data!.docs[index]
                                                      ["imageURL"],
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ["categoryTitle"],
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF01213A),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    padding: EdgeInsets.zero,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      crossAxisSpacing: 0,
                                      mainAxisSpacing: 20,
                                      childAspectRatio: 1,
                                    ),
                                    scrollDirection: Axis.vertical,
                                  );
                                },
                              ),
                            ),
                          ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height: MediaQuery.of(context).size.height * 0.3,
                          //   decoration: BoxDecoration(),
                          //   child: Padding(
                          //       padding: EdgeInsetsDirectional.fromSTEB(
                          //           15, 15, 15, 0),
                          //       child: GridView(
                          //         physics: NeverScrollableScrollPhysics(),
                          //         gridDelegate:
                          //             SliverGridDelegateWithFixedCrossAxisCount(
                          //           crossAxisCount: 4,
                          //           crossAxisSpacing: 6,
                          //           mainAxisSpacing: 30,
                          //         ),
                          //         children: [
                          //           Column(
                          //             children: [
                          //               Container(
                          //                 width: 67,
                          //                 height: 67,
                          //                 padding: EdgeInsets.all(14),
                          //                 decoration: BoxDecoration(
                          //                   // color: Colors.black,
                          //                   color: white,
                          //                   // image: DecorationImage(
                          //                   //   fit: BoxFit.cover,
                          //                   //   image: Image.asset(
                          //                   //     'assets/images/creditcard.png',
                          //                   //   ).image,
                          //                   // ),
                          //                 ),
                          //                 child: Image.asset(
                          //                   'assets/images/creditcard.png',
                          //                 ),
                          //               ),
                          //               SizedBox(
                          //                 height: 2,
                          //               ),
                          //               Text(
                          //                 "Credit Card",
                          //                 textAlign: TextAlign.center,
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .bodyText1
                          //                     .override(
                          //                       fontFamily: 'Manrope',
                          //                       fontSize: 12,
                          //                       fontWeight: FontWeight.w500,
                          //                       color: Color(0xFF01213A),
                          //                     ),
                          //               ),
                          //             ],
                          //           ),
                          //           Column(
                          //             children: [
                          //               Container(
                          //                 width: 67,
                          //                 height: 67,
                          //                 padding: EdgeInsets.all(14),
                          //                 decoration: BoxDecoration(
                          //                   color: white,
                          //                   borderRadius:
                          //                       BorderRadius.circular(8),
                          //                 ),
                          //                 child: Image.asset(
                          //                     'assets/images/cash.png'),
                          //               ),
                          //               SizedBox(
                          //                 height: 2,
                          //               ),
                          //               Text(
                          //                 "Loan",
                          //                 textAlign: TextAlign.center,
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .bodyText1
                          //                     .override(
                          //                       fontFamily: 'Manrope',
                          //                       fontSize: 12,
                          //                       fontWeight: FontWeight.w500,
                          //                       color: Color(0xFF01213A),
                          //                     ),
                          //               ),
                          //             ],
                          //           ),
                          //           Column(
                          //             children: [
                          //               Container(
                          //                 width: 67,
                          //                 height: 67,
                          //                 padding: EdgeInsets.all(14),
                          //                 decoration: BoxDecoration(
                          //                   color: white,
                          //                   borderRadius:
                          //                       BorderRadius.circular(8),
                          //                 ),
                          //                 child: Image.asset(
                          //                     'assets/images/personal-loan.png'),
                          //               ),
                          //               SizedBox(
                          //                 height: 2,
                          //               ),
                          //               Text(
                          //                 "Savings Account",
                          //                 textAlign: TextAlign.center,
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .bodyText1
                          //                     .override(
                          //                       fontFamily: 'Manrope',
                          //                       fontSize: 12,
                          //                       fontWeight: FontWeight.w500,
                          //                       color: Color(0xFF01213A),
                          //                     ),
                          //               ),
                          //             ],
                          //           ),
                          //           Column(
                          //             children: [
                          //               Container(
                          //                 width: 67,
                          //                 height: 67,
                          //                 padding: EdgeInsets.all(14),
                          //                 decoration: BoxDecoration(
                          //                   color: white,
                          //                   borderRadius:
                          //                       BorderRadius.circular(8),
                          //                 ),
                          //                 child: Image.asset(
                          //                     'assets/images/stock.png'),
                          //               ),
                          //               SizedBox(
                          //                 height: 2,
                          //               ),
                          //               Text(
                          //                 "Demat Account",
                          //                 textAlign: TextAlign.center,
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .bodyText1
                          //                     .override(
                          //                       fontFamily: 'Manrope',
                          //                       fontSize: 12,
                          //                       fontWeight: FontWeight.w500,
                          //                       color: Color(0xFF01213A),
                          //                     ),
                          //               ),
                          //             ],
                          //           ),
                          //           Column(
                          //             children: [
                          //               Container(
                          //                 width: 67,
                          //                 height: 67,
                          //                 padding: EdgeInsets.all(14),
                          //                 decoration: BoxDecoration(
                          //                   color: white,
                          //                   borderRadius:
                          //                       BorderRadius.circular(8),
                          //                 ),
                          //                 child: Image.asset(
                          //                     'assets/images/smartphone0.png'),
                          //               ),
                          //               SizedBox(
                          //                 height: 2,
                          //               ),
                          //               Text(
                          //                 "Mobile Campaigns",
                          //                 textAlign: TextAlign.center,
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .bodyText1
                          //                     .override(
                          //                       fontFamily: 'Manrope',
                          //                       fontSize: 12,
                          //                       fontWeight: FontWeight.w500,
                          //                       color: Color(0xFF01213A),
                          //                     ),
                          //               ),
                          //             ],
                          //           ),
                          //           Column(
                          //             children: [
                          //               Container(
                          //                 width: 67,
                          //                 height: 67,
                          //                 padding: EdgeInsets.all(14),
                          //                 decoration: BoxDecoration(
                          //                   color: white,
                          //                   borderRadius:
                          //                       BorderRadius.circular(8),
                          //                 ),
                          //                 child: Image.asset(
                          //                     'assets/images/itr-tax.png'),
                          //               ),
                          //               SizedBox(
                          //                 height: 2,
                          //               ),
                          //               Text(
                          //                 "CPL Campaigns",
                          //                 textAlign: TextAlign.center,
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .bodyText1
                          //                     .override(
                          //                       fontFamily: 'Manrope',
                          //                       fontSize: 12,
                          //                       fontWeight: FontWeight.w500,
                          //                       color: Color(0xFF01213A),
                          //                     ),
                          //               ),
                          //             ],
                          //           ),
                          //           Column(
                          //             children: [
                          //               Container(
                          //                 width: 67,
                          //                 height: 67,
                          //                 padding: EdgeInsets.all(14),
                          //                 decoration: BoxDecoration(
                          //                   color: white,
                          //                   borderRadius:
                          //                       BorderRadius.circular(8),
                          //                 ),
                          //                 child: Image.asset(
                          //                     'assets/images/crypto.png'),
                          //               ),
                          //               SizedBox(
                          //                 height: 2,
                          //               ),
                          //               Text(
                          //                 "Casino Campaigns",
                          //                 textAlign: TextAlign.center,
                          //                 style: FlutterFlowTheme.of(context)
                          //                     .bodyText1
                          //                     .override(
                          //                       fontFamily: 'Manrope',
                          //                       fontSize: 12,
                          //                       fontWeight: FontWeight.w500,
                          //                       color: Color(0xFF01213A),
                          //                     ),
                          //               ),
                          //             ],
                          //           ),
                          //           // Column(
                          //           //   children: [
                          //           //     Container(
                          //           //       width: 67,
                          //           //       height: 67,
                          //           //       padding: EdgeInsets.all(14),
                          //           //       decoration: BoxDecoration(
                          //           //         color: white,
                          //           //         borderRadius:
                          //           //             BorderRadius.circular(8),
                          //           //       ),
                          //           //       child: Image.asset(
                          //           //           'assets/images/crypto.png'),
                          //           //     ),
                          //           //     SizedBox(
                          //           //       height: 2,
                          //           //     ),
                          //           //     Text(
                          //           //       "Crypto",
                          //           //       textAlign: TextAlign.center,
                          //           //       style: FlutterFlowTheme.of(context)
                          //           //           .bodyText1
                          //           //           .override(
                          //           //             fontFamily: 'Manrope',
                          //           //             fontSize: 12,
                          //           //             fontWeight: FontWeight.w500,
                          //           //             color: Color(0xFF01213A),
                          //           //           ),
                          //           //     ),
                          //           //   ],
                          //           // ),
                          //         ],
                          //       )
                          //       // Builder(
                          //       //   builder: (context) {
                          //       //     final random = List.generate(
                          //       //             random_data.randomInteger(1, 4),
                          //       //             (index) =>
                          //       //                 random_data.randomInteger(0, 0))
                          //       //         .toList()
                          //       //         .take(8)
                          //       //         .toList();
                          //       //     return GridView.builder(
                          //       //       physics: NeverScrollableScrollPhysics(),
                          //       //       padding: EdgeInsets.zero,
                          //       //       gridDelegate:
                          //       //           SliverGridDelegateWithFixedCrossAxisCount(
                          //       //         crossAxisCount: 4,
                          //       //         crossAxisSpacing: 10,
                          //       //         mainAxisSpacing: 10,
                          //       //         childAspectRatio: 1,
                          //       //       ),
                          //       //       scrollDirection: Axis.vertical,
                          //       //       itemCount: random.length,
                          //       //       itemBuilder: (context, randomIndex) {
                          //       //         final randomItem = random[randomIndex];
                          //       //         return Column(
                          //       //           mainAxisSize: MainAxisSize.max,
                          //       //           children: [
                          //       //             Align(
                          //       //               alignment:
                          //       //                   AlignmentDirectional(0, 0),
                          //       //               child: Container(
                          //       //                 width: 67,
                          //       //                 height: 67,
                          //       //                 decoration: BoxDecoration(
                          //       //                   // color: Colors.black,
                          //       //                   color:
                          //       //                       FlutterFlowTheme.of(context)
                          //       //                           .secondaryBackground,
                          //       //                   image: DecorationImage(
                          //       //                     fit: BoxFit.cover,
                          //       //                     image: Image.asset(
                          //       //                       'assets/images/Group_391.png',
                          //       //                     ).image,
                          //       //                   ),
                          //       //                 ),
                          //       //               ),
                          //       //             ),
                          //       //             Text(
                          //       //               FFLocalizations.of(context).getText(
                          //       //                 '2476mxe2' /* Credit Card */,
                          //       //               ),
                          //       //               style: FlutterFlowTheme.of(context)
                          //       //                   .bodyText1
                          //       //                   .override(
                          //       //                     fontFamily: 'Manrope',
                          //       //                     fontSize: 12,
                          //       //                     fontWeight: FontWeight.w500,
                          //       //                     color: Colors.black,
                          //       //                   ),
                          //       //             ),
                          //       //           ],
                          //       //         );
                          //       //       },
                          //       //     );
                          //       //   },
                          //       // ),
                          //       ),
                          // ),
                          // // Container(
                          // //   width: MediaQuery.of(context).size.width,
                          // //   height: 179,
                          // //   decoration: BoxDecoration(
                          // //     color: FlutterFlowTheme.of(context)
                          // //         .secondaryBackground,
                          // //   ),
                          // //   child: ListView(
                          // //     padding: EdgeInsets.zero,
                          // //     shrinkWrap: true,
                          // //     scrollDirection: Axis.horizontal,
                          // //     children: [
                          // //       Padding(
                          // //         padding: EdgeInsetsDirectional.fromSTEB(
                          // //             15, 0, 0, 0),
                          // //         child: InkWell(
                          // //           onTap: () {
                          // //             Navigator.push(
                          // //                 context,
                          // //                 MaterialPageRoute(
                          // //                     builder: (_) =>
                          // //                         SellnearndetailWidget()));
                          // //           },
                          // //           child: Column(
                          // //             mainAxisSize: MainAxisSize.max,
                          // //             children: [
                          // //               Container(
                          // //                 width: 88,
                          // //                 height: 88,
                          // //                 decoration: BoxDecoration(
                          // //                   color: Color(0xFFAE2D2D),
                          // //                   shape: BoxShape.circle,
                          // //                 ),
                          // //               ),
                          // //               Padding(
                          // //                 padding:
                          // //                     EdgeInsetsDirectional.fromSTEB(
                          // //                         0, 5, 0, 0),
                          // //                 child: Text(
                          // //                   FFLocalizations.of(context).getText(
                          // //                     'eqxzxlau' /* Niyox Savings */
                          // //                     ,
                          // //                   ),
                          // //                   textAlign: TextAlign.center,
                          // //                   style: FlutterFlowTheme.of(context)
                          // //                       .bodyText1
                          // //                       .override(
                          // //                         fontFamily: 'Manrope',
                          // //                         fontWeight: FontWeight.normal,
                          // //                       ),
                          // //                 ),
                          // //               ),
                          // //               Padding(
                          // //                 padding:
                          // //                     EdgeInsetsDirectional.fromSTEB(
                          // //                         0, 8, 0, 0),
                          // //                 child: Container(
                          // //                   width: 52,
                          // //                   height: 12,
                          // //                   decoration: BoxDecoration(
                          // //                     borderRadius:
                          // //                         BorderRadius.circular(100),
                          // //                     border: Border.all(
                          // //                       color: Color(0xFF2DDD4F),
                          // //                       width: 0.75,
                          // //                     ),
                          // //                   ),
                          // //                   child: Text(
                          // //                     FFLocalizations.of(context)
                          // //                         .getText(
                          // //                       'd48nr2cy' /* Earn ₹450 */,
                          // //                     ),
                          // //                     textAlign: TextAlign.center,
                          // //                     style:
                          // //                         FlutterFlowTheme.of(context)
                          // //                             .bodyText1
                          // //                             .override(
                          // //                               fontFamily: 'Manrope',
                          // //                               color:
                          // //                                   Color(0xFF2DDD4F),
                          // //                               fontSize: 8,
                          // //                               fontWeight:
                          // //                                   FontWeight.normal,
                          // //                             ),
                          // //                   ),
                          // //                 ),
                          // //               ),
                          // //               Padding(
                          // //                 padding:
                          // //                     EdgeInsetsDirectional.fromSTEB(
                          // //                         0, 10, 0, 0),
                          // //                 child: Text(
                          // //                   FFLocalizations.of(context).getText(
                          // //                     '5wo70lw9' /* 00:30 min Left */,
                          // //                   ),
                          // //                   style: FlutterFlowTheme.of(context)
                          // //                       .bodyText1
                          // //                       .override(
                          // //                         fontFamily: 'Manrope',
                          // //                         color: Color(0xFFEFC42F),
                          // //                         fontSize: 10,
                          // //                         fontWeight: FontWeight.bold,
                          // //                       ),
                          // //                 ),
                          // //               ),
                          // //             ],
                          // //           ),
                          // //         ),
                          // //       ),
                          // //     ],
                          // //   ),
                          // // ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.18,
                              decoration: BoxDecoration(),
                              child: ListView(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.05, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 10, 0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      ProfileKYCdetailsWidget()));
                                        },
                                        child: Container(
                                          width: 256,
                                          height: 115,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.asset(
                                                'assets/images/Group_446.png',
                                              ).image,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 0.2,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.05, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 10, 0),
                                      child: Container(
                                        width: 256,
                                        height: 115,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/unnamed_(4)_1.png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 0.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15, 10, 15, 10),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'xcj0whng' /* What's new ✨ */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            height: 180,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    height: 130,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3D9BFC),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Made in india with love-Team infilate",
                                          style: GoogleFonts.chivo(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 14,
                                            color: white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 145,
                                          height: 2,
                                          color: white,
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(7),
                                        height: 120,
                                        width: 102,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFBFEBFF),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Unlock your rewards!",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 10,
                                              ),
                                            ),
                                            Container(
                                              height: 45,
                                              width: 45,
                                              padding: EdgeInsets.all(
                                                7,
                                              ),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: white,
                                              ),
                                              child: Center(
                                                child: Image.asset(
                                                  "assets/images/award.gif",
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Earn upto ₹500",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          const url = "https://creasip.com/";
                                          if (await canLaunchUrlString(url)) {
                                            launchURL(url);
                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Couldnt launch website.");
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 120,
                                          width: 102,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFBFFFC2),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 4,
                                                offset: Offset(0, 4),
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                              )
                                            ],
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Text(
                                              //   "Unlock your rewards!",
                                              //   textAlign: TextAlign.center,
                                              //   style: GoogleFonts.manrope(
                                              //     fontWeight: FontWeight.w600,
                                              //     fontSize: 10,
                                              //   ),
                                              // ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  height: 62,
                                                  width: 62,
                                                  padding: EdgeInsets.all(
                                                    9,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: white,
                                                  ),
                                                  child: Center(
                                                    child: Image.asset(
                                                      "assets/images/browser.gif",
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Visit \n Our Website",
                                                textAlign: TextAlign.end,
                                                style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        height: 120,
                                        width: 102,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFC0ABE4),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                height: 62,
                                                width: 62,
                                                padding: EdgeInsets.all(
                                                  10,
                                                ),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: white,
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    "assets/images/tech-support.gif",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "Need any Help?",
                                              textAlign: TextAlign.end,
                                              style: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
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
                          // Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     height: MediaQuery.of(context).size.height * 0.1,
                          //     decoration: BoxDecoration(
                          //       color: FlutterFlowTheme.of(context)
                          //           .secondaryBackground,
                          //     ),
                          //     child: Row(
                          //       mainAxisSize: MainAxisSize.max,
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Align(
                          //           alignment: AlignmentDirectional(0, 0),
                          //           child: Padding(
                          //             padding: EdgeInsetsDirectional.fromSTEB(
                          //                 15, 0, 10, 0),
                          //             child: Container(
                          //               width: 154,
                          //               height: 75,
                          //               decoration: BoxDecoration(
                          //                 color: Colors.transparent,
                          //                 image: DecorationImage(
                          //                   fit: BoxFit.cover,
                          //                   image: Image.asset(
                          //                     'assets/images/Group_447.png',
                          //                   ).image,
                          //                 ),
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         Align(
                          //           alignment: AlignmentDirectional(0, 0),
                          //           child: Padding(
                          //             padding: EdgeInsetsDirectional.fromSTEB(
                          //                 10, 0, 15, 0),
                          //             child: Container(
                          //               width: 154,
                          //               height: 75,
                          //               decoration: BoxDecoration(
                          //                 color: Colors.white,
                          //                 image: DecorationImage(
                          //                   fit: BoxFit.cover,
                          //                   image: Image.asset(
                          //                     'assets/images/Group_449.png',
                          //                   ).image,
                          //                 ),
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
                          //   child: Container(
                          //     width: MediaQuery.of(context).size.width,
                          //     height: MediaQuery.of(context).size.height * 0.1,
                          //     decoration: BoxDecoration(
                          //       color: FlutterFlowTheme.of(context)
                          //           .secondaryBackground,
                          //     ),
                          //     child: Row(
                          //       mainAxisSize: MainAxisSize.max,
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         Align(
                          //           alignment: AlignmentDirectional(0, 0),
                          //           child: Padding(
                          //             padding: EdgeInsetsDirectional.fromSTEB(
                          //                 15, 0, 10, 0),
                          //             child: Container(
                          //               width: 154,
                          //               height: 75,
                          //               decoration: BoxDecoration(
                          //                 color: Colors.white,
                          //                 image: DecorationImage(
                          //                   fit: BoxFit.cover,
                          //                   image: Image.asset(
                          //                     'assets/images/Group_450.png',
                          //                   ).image,
                          //                 ),
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         Align(
                          //           alignment: AlignmentDirectional(0, 0),
                          //           child: Padding(
                          //             padding: EdgeInsetsDirectional.fromSTEB(
                          //                 10, 0, 15, 0),
                          //             child: Container(
                          //               width: 154,
                          //               height: 75,
                          //               decoration: BoxDecoration(
                          //                 color: Colors.white,
                          //                 image: DecorationImage(
                          //                   fit: BoxFit.cover,
                          //                   image: Image.asset(
                          //                     'assets/images/Group_451.png',
                          //                   ).image,
                          //                 ),
                          //                 borderRadius:
                          //                     BorderRadius.circular(5),
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 180,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: Image.asset(
                                  'assets/images/Join_us_on_social_Media_(2).png',
                                ).image,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    const url =
                                        "https://www.facebook.com/people/Creasip/100087081517705/";
                                    if (await canLaunchUrlString(url)) {
                                      launchURL(url);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Couldnt launch website.");
                                    }
                                  },
                                  child: Container(
                                    width: 63,
                                    height: 63,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/facebook_(8)_1.png',
                                        ).image,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    const url =
                                        "https://www.instagram.com/creasip_co/?igshid=YmMyMTA2M2Y%3D";
                                    if (await canLaunchUrlString(url)) {
                                      launchURL(url);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Couldnt launch website.");
                                    }
                                  },
                                  child: Container(
                                    width: 63,
                                    height: 63,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/instagram_(10)_1.png',
                                        ).image,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 63,
                                  height: 63,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: Image.asset(
                                        'assets/images/twitter_(2)_1.png',
                                      ).image,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    const url =
                                        "https://www.linkedin.com/company/creasip";
                                    if (await canLaunchUrlString(url)) {
                                      launchURL(url);
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Couldnt launch website.");
                                    }
                                  },
                                  child: Container(
                                    width: 63,
                                    height: 63,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: Image.asset(
                                          'assets/images/linkedin_(1)_1.png',
                                        ).image,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 30, 0, 30),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'vaih1ol4' /* What People are saying */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 155,
                              decoration: BoxDecoration(),
                              child: Container(
                                width: double.infinity,
                                height: 15,
                                child: PageView(
                                  controller: pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Stack(
                                      alignment: AlignmentDirectional(0, 1),
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    40, 0, 30, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Pooja",
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(30, 15, 0, 15),
                                                  child: Container(
                                                    width: 220,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                    ),
                                                    child: Text(
                                                      "Working in the organisation , Cool to Work , Happy to be a part of the company . Working with more than 1 Lakh+ Community of Freelancers and Influencers",
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1, -1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        width: 2,
                                                        color:
                                                            Color(0xFF2DDD4F),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 82,
                                                      height: 82,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/581/600',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '495s9mfe' /* 4.0 */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  fontSize: 16,
                                                                ),
                                                      ),
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue1 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            Color(0xFFEFC42F),
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue1 ??= 4,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 15,
                                                      glowColor:
                                                          Color(0xFFEFC42F),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(70, 32, 0, 0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ooybr9kb' /* 24 July 2022 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            Color(0xFF858585),
                                                        fontSize: 10,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(
                                      alignment: AlignmentDirectional(0, 1),
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 0, 25, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Abhishek Jain",
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(30, 15, 0, 15),
                                                  child: Container(
                                                    width: 200,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                    ),
                                                    child: Text(
                                                      "Happy to collab with Creasip , Easy to use , Easy to see reports and withdraw.",
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1, -1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.transparent,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color:
                                                            Color(0xFF2DDD4F),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 82,
                                                      height: 82,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        'https://picsum.photos/seed/581/600',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'i662bj01' /* 4.0 */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  fontSize: 16,
                                                                ),
                                                      ),
                                                    ),
                                                    RatingBar.builder(
                                                      onRatingUpdate: (newValue) =>
                                                          setState(() =>
                                                              ratingBarValue2 =
                                                                  newValue),
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Icon(
                                                        Icons.star_rounded,
                                                        color:
                                                            Color(0xFFEFC42F),
                                                      ),
                                                      direction:
                                                          Axis.horizontal,
                                                      initialRating:
                                                          ratingBarValue2 ??= 3,
                                                      unratedColor:
                                                          Color(0xFF9E9E9E),
                                                      itemCount: 5,
                                                      itemSize: 15,
                                                      glowColor:
                                                          Color(0xFFEFC42F),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(70, 32, 0, 0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'u4dnzycx' /* 24 July 2022 */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        color:
                                                            Color(0xFF858585),
                                                        fontSize: 10,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 35, 15, 35),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 152,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Group_113.png',
                                  ).image,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // if (random_data.randomInteger(0, 0) == 123)
            //   Align(
            //     alignment: AlignmentDirectional(0, 1),
            //     child: Container(
            //       width: MediaQuery.of(context).size.width,
            //       height: MediaQuery.of(context).size.height * 0.1,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //       ),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.max,
            //         mainAxisAlignment: MainAxisAlignment.spaceAround,
            //         children: [
            //           Column(
            //             mainAxisSize: MainAxisSize.max,
            //             children: [
            //               Padding(
            //                 padding:
            //                     EdgeInsetsDirectional.fromSTEB(12, 14, 12, 8),
            //                 child: Icon(
            //                   Icons.home_outlined,
            //                   color: Color(0xFFD9D9D9),
            //                   size: 25,
            //                 ),
            //               ),
            //               Text(
            //                 FFLocalizations.of(context).getText(
            //                   'blqfzjxe' /* Home */,
            //                 ),
            //                 style:
            //                     FlutterFlowTheme.of(context).bodyText1.override(
            //                           fontFamily: 'Manrope',
            //                           color: Color(0xFF99A9BF),
            //                           fontSize: 12,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //               ),
            //             ],
            //           ),
            //           Column(
            //             mainAxisSize: MainAxisSize.max,
            //             children: [
            //               Padding(
            //                 padding:
            //                     EdgeInsetsDirectional.fromSTEB(12, 14, 12, 8),
            //                 child: Icon(
            //                   Icons.flag_rounded,
            //                   color: Color(0xFFD9D9D9),
            //                   size: 25,
            //                 ),
            //               ),
            //               Text(
            //                 FFLocalizations.of(context).getText(
            //                   'o6q525sl' /* Lead */,
            //                 ),
            //                 style:
            //                     FlutterFlowTheme.of(context).bodyText1.override(
            //                           fontFamily: 'Manrope',
            //                           color: Color(0xFF99A9BF),
            //                           fontSize: 12,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //               ),
            //             ],
            //           ),
            //           Align(
            //             alignment: AlignmentDirectional(0, 0),
            //             child: Container(
            //               width: MediaQuery.of(context).size.width * 0.12,
            //               height: 100,
            //               decoration: BoxDecoration(
            //                 color: Colors.transparent,
            //               ),
            //             ),
            //           ),
            //           Column(
            //             mainAxisSize: MainAxisSize.max,
            //             children: [
            //               Padding(
            //                 padding:
            //                     EdgeInsetsDirectional.fromSTEB(12, 14, 12, 8),
            //                 child: Icon(
            //                   Icons.star_border,
            //                   color: Color(0xFFD9D9D9),
            //                   size: 25,
            //                 ),
            //               ),
            //               Text(
            //                 FFLocalizations.of(context).getText(
            //                   'jrl3fhfs' /* Refferal */,
            //                 ),
            //                 style:
            //                     FlutterFlowTheme.of(context).bodyText1.override(
            //                           fontFamily: 'Manrope',
            //                           color: Color(0xFF99A9BF),
            //                           fontSize: 12,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //               ),
            //             ],
            //           ),
            //           Column(
            //             mainAxisSize: MainAxisSize.max,
            //             children: [
            //               Padding(
            //                 padding:
            //                     EdgeInsetsDirectional.fromSTEB(12, 14, 12, 9),
            //                 child: FaIcon(
            //                   FontAwesomeIcons.graduationCap,
            //                   color: Color(0xFFD9D9D9),
            //                   size: 20,
            //                 ),
            //               ),
            //               Text(
            //                 FFLocalizations.of(context).getText(
            //                   'yoe8pgmq' /* Traning */,
            //                 ),
            //                 style:
            //                     FlutterFlowTheme.of(context).bodyText1.override(
            //                           fontFamily: 'Manrope',
            //                           color: Color(0xFF99A9BF),
            //                           fontSize: 12,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // if (getCurrentTimestamp == getCurrentTimestamp)
            //   Align(
            //     alignment: AlignmentDirectional(0, 0.9),
            //     child: Container(
            //       width: 80,
            //       height: 80,
            //       decoration: BoxDecoration(
            //         color: Colors.transparent,
            //         image: DecorationImage(
            //           fit: BoxFit.cover,
            //           image: Image.asset(
            //             'assets/images/Group_176.png',
            //           ).image,
            //         ),
            //         shape: BoxShape.circle,
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}
