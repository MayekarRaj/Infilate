import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infilate/backend/otp_Service.dart';
import 'package:infilate/components/customer_details_verification.dart';
import 'package:infilate/flutter_flow/flutter_flow_theme.dart';
import 'package:infilate/profile/profile_widget.dart';
import 'package:infilate/wallet/wallet_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/seaa_widget.dart';
import 'constants.dart';
import 'flutter_flow/flutter_flow_icon_button.dart';
import 'flutter_flow/flutter_flow_widgets.dart';
import 'flutter_flow/internationalization.dart';

class AddCustomer extends StatefulWidget {
  final String id;
  final String name;
  AddCustomer({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  TextEditingController? phoneNumber;
  TextEditingController? name;
  TextEditingController? panNumber;
  TextEditingController? email;
  TextEditingController? adhaar;

  @override
  void initState() {
    super.initState();
    phoneNumber = TextEditingController();
    name = TextEditingController();
    panNumber = TextEditingController();
    email = TextEditingController();
    adhaar = TextEditingController();
  }

  Future addData(String number, String pan, String id, String name,
      String campaignName, String email, String adhaar) async {
    final prefs = await SharedPreferences.getInstance();
    final firestore = FirebaseFirestore.instance;

    // DocumentReference doc = firestore.collection("dummy").doc();
    // print(doc.id);
    // prefs.setString("docId", doc.id);

    await firestore
        .collection("Leads")
        .doc('${FirebaseAuth.instance.currentUser!.uid}-$id')
        .set({
      "phoneNumber": number,
      "name": name,
      "panNumber": pan,
      "emailID": email,
      "adhaar": adhaar,
      "campaignId": id,
      "publisher_id": FirebaseAuth.instance.currentUser!.uid,
      "campaign_name": campaignName,
      "status": "In Process",
    });

    // await firestore
    //     .collection("publisher_database")
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .collection("leads")
    //     .doc()
    //     .set({
    //   "phoneNumber": number,
    //   "name": name,
    //   "panNumber": pan,
    //   "campaignId": id,
    //   "campaign_name": campaignName,
    //   "status": "inprogress",
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF012139),
        automaticallyImplyLeading: true,
        title: Text(
          "Add Customer",
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Manrope',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: white,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mobile Number of Customer",
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff01213A),
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  // color: Color(0xffE7E7E7),
                  border: Border.all(
                    color: Color(0xffE7E7E7),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  // initialValue: widget.name ?? null,
                  controller: phoneNumber,
                  autofocus: true,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "+91",
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
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Name as per PAN Card",
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff01213A),
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  // color: Color(0xffE7E7E7),
                  border: Border.all(
                    color: Color(0xffE7E7E7),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  // initialValue: widget.name ?? null,
                  controller: name,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "Full Name",
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
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Customer PAN Number",
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff01213A),
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  // color: Color(0xffE7E7E7),
                  border: Border.all(
                    color: Color(0xffE7E7E7),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  // initialValue: widget.name ?? null,
                  controller: panNumber,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "XXXX XXXX",
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
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Email ID",
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff01213A),
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  // color: Color(0xffE7E7E7),
                  border: Border.all(
                    color: Color(0xffE7E7E7),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  // initialValue: widget.name ?? null,
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "",
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
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Adhaar Card Number",
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Manrope',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff01213A),
                    ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  // color: Color(0xffE7E7E7),
                  border: Border.all(
                    color: Color(0xffE7E7E7),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  // initialValue: widget.name ?? null,
                  controller: adhaar,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    // hintText: "+91",
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
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Manrope',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FFButtonWidget(
                onPressed: () async {
                  if (phoneNumber!.text.length != 10) {
                    return Fluttertoast.showToast(msg: "Enter a number");
                  }
                  await addData(
                    phoneNumber!.text,
                    panNumber!.text,
                    widget.id,
                    name!.text,
                    widget.name,
                    email!.text,
                    adhaar!.text,
                  );
                  Navigator.pop(context);
                  // showModalBottomSheet(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(30),
                  //   ),
                  //   context: context,
                  //   builder: (_) {
                  //     return CustomerVerification();
                  //   },
                  // );
                },
                text: "SUBMIT",
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 48,
                  color: Color(0xFF0044EB),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Chivo',
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(87),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "By clicking here start you agree to our",
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Manrope',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff858585),
                      ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Privacy Policy and terms",
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Manrope',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xff3D9BFC),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
