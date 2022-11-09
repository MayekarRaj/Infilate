import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infilate/components/verfiy_details_bottom.dart';
import 'package:infilate/constants.dart';
import 'package:infilate/flutter_flow/flutter_flow_icon_button.dart';
import 'package:infilate/flutter_flow/flutter_flow_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/customer_details_verification.dart';
import 'components/seaa_widget.dart';
import 'flutter_flow/flutter_flow_theme.dart';

class VerifyDetails extends StatefulWidget {
  VerifyDetails({Key? key}) : super(key: key);

  @override
  State<VerifyDetails> createState() => _VerifyDetailsState();
}

class _VerifyDetailsState extends State<VerifyDetails> {
  List<String> employmentType = ["Permanent", "Temporary"];
  String? selectedEmploy = "Permanent";

  TextEditingController? name;
  TextEditingController? pincode;
  TextEditingController? companyName;
  TextEditingController? monthlySalary;

  @override
  void initState() {
    super.initState();
    name = TextEditingController();
    pincode = TextEditingController();
    companyName = TextEditingController();
    monthlySalary = TextEditingController();
  }

  Future addData(String name, String pincode, String company,
      String employement, String salary) async {
    final prefs = await SharedPreferences.getInstance();
    final firestore = FirebaseFirestore.instance;

    final doc = prefs.getString("docId");
    print(doc);

    // print(Constants().docId);

    await firestore.collection("dummy").doc(doc).update({
      "nameAsPerPANCard": name,
      "pincode": pincode,
      "currrentCompanyName": company,
      "employementType": employement,
      "monthlySalary": salary,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF378BFC),
        automaticallyImplyLeading: true,
        title: Text(
          "Verify Details",
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
                "Pincode",
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
                  controller: pincode,
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
                "Current Company Name",
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
                  controller: companyName,
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
                "Employement Type",
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
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Color(0xffE7E7E7),
                  border: Border.all(
                    color: Color(0xffE7E7E7),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down),
                    onChanged: (item) {
                      setState(() {
                        selectedEmploy = item;
                      });
                    },
                    value: selectedEmploy,
                    items: employmentType
                        .map((item) => DropdownMenuItem(
                              child: Text(item),
                              value: item,
                            ))
                        .toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Monthly Salary",
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
                  controller: monthlySalary,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "₹ ",
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
                  await addData(name!.text, pincode!.text, companyName!.text,
                      selectedEmploy!, monthlySalary!.text);
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    context: context,
                    builder: (_) {
                      return VerifyDetailsBottom();
                    },
                  );
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
