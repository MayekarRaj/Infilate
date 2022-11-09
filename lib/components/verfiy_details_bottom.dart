import 'package:flutter/material.dart';
import 'package:infilate/flutter_flow/internationalization.dart';
import 'package:infilate/verify_details.dart';
import 'package:pinput/pinput.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class VerifyDetailsBottom extends StatefulWidget {
  final String? number;
  VerifyDetailsBottom({Key? key, this.number}) : super(key: key);

  @override
  State<VerifyDetailsBottom> createState() => _VerifyDetailsBottomState();
}

class _VerifyDetailsBottomState extends State<VerifyDetailsBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
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
                    fontWeight: FontWeight.w600,
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
                // setState(() {
                //   otpCode = value;
                // });
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
                'to ${widget.number} ',
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
                //     builder: (ctx) => VerifyDetails(),
                //   ),
                // );
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
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
