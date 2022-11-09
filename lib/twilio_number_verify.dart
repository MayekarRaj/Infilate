import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infilate/backend/api_requests/api_calls.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

import 'backend/api_requests/api_manager.dart';
import 'create_profile/create_profile_widget.dart';
import 'flutter_flow/flutter_flow_drop_down.dart';
import 'flutter_flow/flutter_flow_icon_button.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'flutter_flow/internationalization.dart';

class TwilioNumberVerify extends StatefulWidget {
  final String? name;
  final String? email;
  TwilioNumberVerify({Key? key, this.name, this.email}) : super(key: key);

  @override
  State<TwilioNumberVerify> createState() => _TwilioNumberVerifyState();
}

class _TwilioNumberVerifyState extends State<TwilioNumberVerify> {
  TextEditingController? textController1;
  TextEditingController? textController2;
  String? dropDownValue;

  bool codeSent = false;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  Future sendSMS(String number) async {
    TwilioPhoneVerify _twilioPhoneVerify;

    _twilioPhoneVerify = new TwilioPhoneVerify(
      accountSid:
          'ACdd01ae494608bdc5f7199e560b1f7260', // replace with Account SID
      authToken: 'b9a691a8e253ebd1fa200c5d296d8f5d', // replace with Auth Token
      serviceSid:
          'VA84ba8d4bb0a02c385a0f704b35268900', // replace with Service SID
    );

    final twilioResponse =
        await _twilioPhoneVerify.sendSmsCode("$dropDownValue$number");

    if (twilioResponse.successful!) {
      print("Code Sent!!!!");
      setState(() {
        codeSent = true;
      });
    } else {
      print(twilioResponse.errorMessage);
    }
  }

  Future verify(String number, String code) async {
    TwilioPhoneVerify _twilioPhoneVerify;

    _twilioPhoneVerify = new TwilioPhoneVerify(
      accountSid:
          'ACdd01ae494608bdc5f7199e560b1f7260', // replace with Account SID
      authToken: 'b9a691a8e253ebd1fa200c5d296d8f5d', // replace with Auth Token
      serviceSid:
          'VA84ba8d4bb0a02c385a0f704b35268900', // replace with Service SID
    );

    var twilioResponse =
        await _twilioPhoneVerify.verifySmsCode(phone: '$number', code: '$code');

    if (twilioResponse.successful!) {
      if (twilioResponse.verification?.status == VerificationStatus.approved) {
        print('Phone number is approved');
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateProfileWidget(
              name: widget.name,
              email: widget.email,
              number: number,
            ),
          ),
        );
      } else {
        print('Invalid code');
      }
    } else {
      //print(twilioResponse.errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
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
                  "Phone Number Verification",
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Manrope',
                        color: Color(0xFF01213A),
                        fontSize: 27,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 55, 0, 5),
                  child: Text(
                    "Enter your number",
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Manrope',
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 40),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: CountryCodeCall.call(),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final dropDownCountryCodeResponse =
                                  snapshot.data!;
                              return FlutterFlowDropDown(
                                initialOption: dropDownValue ??= "+91",
                                options: (CountryCodeCall.dialCode(
                                  dropDownCountryCodeResponse.jsonBody,
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()
                                    .toList(),
                                onChanged: (val) =>
                                    setState(() => dropDownValue = val),
                                width: 70,
                                height: 50,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: Color(0xFF7C7979),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                hintText: FFLocalizations.of(context).getText(
                                  'hihgzgen' /* +91 */,
                                ),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 15,
                                ),
                                elevation: 0,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12, 4, 12, 4),
                                hidesUnderline: true,
                              );
                            },
                          ),
                        ),
                        // VerticalDivider(
                        //   width: 10,
                        //   thickness: 10,
                        //   color: Colors.black,
                        // ),
                        Expanded(
                          child: TextFormField(
                            controller: textController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: "Number",
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
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Manrope',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (codeSent)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: Text(
                          "Enter the OTP",
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Manrope',
                                    color: Color(0xFF000000),
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
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
                                  controller: textController2,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: "OTP",
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
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
                  child: FFButtonWidget(
                    onPressed: () async {
                      if (codeSent)
                        await verify(
                            (dropDownValue! + "" + textController1!.text),
                            textController2!.text);
                      else
                        await sendSMS(textController1!.text);
                    },
                    text: codeSent ? "Verify" : "Send OTP",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
