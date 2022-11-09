import 'package:infilate/constants.dart';
import 'package:infilate/k_y_c_details02/k_y_c_details02_widget.dart';
import 'package:infilate/mainpage.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main_screen/main_screen_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'k_y_c_details01/k_y_c_details01_widget.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({Key? key}) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool affilate = false;
  bool influencer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 350, 0, 0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 00),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 72,
                        height: 6,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Rectangle_17.png',
                            ).image,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 0),
                  child: Text(
                    "Choose your switch",
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Manrope',
                          color: Color(0xFF0044EB),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 30, 16, 0),
                  child: Container(
                    height: 60,
                    decoration: affilate
                        ? BoxDecoration(
                            border:
                                Border.all(color: Color(0xFF01213A), width: 2),
                            borderRadius: BorderRadius.circular(10),
                          )
                        : null,
                    child: Center(
                      child: ListTile(
                        // shape: affilate
                        //     ? RoundedRectangleBorder(
                        //         side:
                        //             BorderSide(color: Color(0xFF01213A), width: 2),
                        //         borderRadius: BorderRadius.circular(10),
                        //       )
                        //     : null,
                        onTap: () {
                          setState(() {
                            affilate = true;
                            influencer = false;
                          });
                        },
                        leading: Image.asset(
                          "assets/images/affilate.png",
                          width: 21,
                          height: 27,
                        ),
                        title: Text(
                          "Affilate",
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Manrope',
                                    color: Color(0xFF01213A),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                  child: Container(
                    height: 120,
                    decoration: influencer
                        ? BoxDecoration(
                            border:
                                Border.all(color: Color(0xFF01213A), width: 2),
                            borderRadius: BorderRadius.circular(10),
                          )
                        : null,
                    child: ListTile(
                      // shape: influencer
                      //     ? RoundedRectangleBorder(
                      //         side:
                      //             BorderSide(color: Color(0xFF01213A), width: 2),
                      //         borderRadius: BorderRadius.circular(10),
                      //       )
                      //     : null,
                      onTap: () {
                        setState(() {
                          influencer = true;
                          affilate = false;
                        });
                      },
                      leading: Image.asset(
                        "assets/images/influencer.png",
                        width: 24,
                        height: 24,
                      ),
                      title: Text(
                        "Influencer",
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Manrope',
                              color: Color(0xFF01213A),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      subtitle: Text(
                        "Influencer marketing is a social media strategy where an influencer receives a payout for endorsing a brand's product.",
                      ),
                      trailing: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 15, 16, 40),
                    child: FFButtonWidget(
                      onPressed: () async {
                        // Navigator.pop(context);
                        // await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MainScreenWidget(),
                        //   ),
                        // );
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => KYCDetails01Widget(),
                          ),
                        );
                      },
                      text: "GET STARTED",
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 48,
                        color: Color(0xFF0044EB),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
