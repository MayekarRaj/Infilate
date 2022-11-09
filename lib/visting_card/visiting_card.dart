import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:infilate/visting_card/visting_card_export.dart';
import 'package:infilate/visting_card/visting_model.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class VistingCard extends StatelessWidget {
  final String uid;
  final String name;
  final String number;
  final String email;
  final String education;
  const VistingCard({
    Key? key,
    required this.uid,
    required this.name,
    required this.number,
    required this.email,
    required this.education,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(uid, name, number, email, education),
      ),
    );
  }
}
