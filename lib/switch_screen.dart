import 'dart:async';

import 'package:flutter/material.dart';
import 'package:infilate/constants.dart';
import 'package:infilate/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'flutter_flow/flutter_flow_theme.dart';

class SwitchScreen extends StatefulWidget {
  SwitchScreen({Key? key}) : super(key: key);

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool switched = false;
  String? switchValue;

  Future switchTo() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString("switch") == "Influencer") {
      prefs.setString("switch", "Affilate");
    } else {
      prefs.setString("switch", "Influencer");
    }

    setState(() {
      switchValue = prefs.getString("switch");
    });
    print("Switch Value: $switchValue");
    // widget.onFunction;
    Future.delayed(
      Duration(seconds: 2),
      () {
        setState(() {
          switched = true;
        });
      },
    );

    Future.delayed(
      Duration(seconds: 4),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => MainScreen()));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    switchTo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: !switched
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: title,
                    strokeWidth: 5,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Switching...",
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Manrope',
                          color: Color(0xFF01213A),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  switchValue == "Influencer"
                      ? Image.asset("assets/images/influencer.png")
                      : Image.asset("assets/images/affilate.png"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Switched to $switchValue",
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Manrope',
                          color: Color(0xFF01213A),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // Text(
                  //   "Go to Home to continue",
                  //   style: FlutterFlowTheme.of(context).bodyText1.override(
                  //         fontFamily: 'Manrope',
                  //         color: Color(0xFF01213A),
                  //         fontSize: 16,
                  //         fontWeight: FontWeight.w600,
                  //       ),
                  // ),

                  // ElevatedButton(onPressed: widget.onFunction, child: Text("Continue"))
                ],
              ),
      ),
    );
  }
}
