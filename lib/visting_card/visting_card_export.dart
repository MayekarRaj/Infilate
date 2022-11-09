import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';

Future<Uint8List> makePdf(String uid, String name, String number, String email,
    String education) async {
  final pdf = pw.Document();
  final manrope = await PdfGoogleFonts.manropeBold();
  final manrope600 = await PdfGoogleFonts.manropeSemiBold();
  final imageLogo = pw.MemoryImage(
      (await rootBundle.load('assets/images/ppl.png')).buffer.asUint8List());
  // final imageLogo = pw.MemoryImage(
  //   File('assets/images/ppl.png').readAsBytesSync(),
  // );

  pdf.addPage(
    pw.Page(
      build: (context) {
        return pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Container(
              width: 300,
              height: 170,
              padding: pw.EdgeInsets.all(16),
              decoration: pw.BoxDecoration(
                // color: PdfColors.,
                borderRadius: pw.BorderRadius.circular(8),
                border: pw.Border.all(
                  width: 2,
                  color: PdfColor.fromHex('3D9BFC'),
                ),
              ),
              child: pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      children: [
                        pw.Image(
                          imageLogo,
                          height: 100,
                          width: 100,
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          uid,
                          style: pw.TextStyle(
                            font: manrope,
                            fontSize: 20,
                            color: PdfColor.fromHex("01213A"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 20),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          name,
                          textAlign: pw.TextAlign.center,
                          style: pw.TextStyle(
                            font: manrope,
                            fontSize: 20,
                            color: PdfColor.fromHex("01213A"),
                          ),
                        ),
                        pw.Text(
                          number,
                          style: pw.TextStyle(
                            font: manrope600,
                            fontSize: 12,
                            color: PdfColor.fromInt(0xAA000000),
                          ),
                        ),
                        pw.Text(
                          email,
                          style: pw.TextStyle(
                            font: manrope600,
                            fontSize: 12,
                            color: PdfColor.fromInt(0xAA000000),
                          ),
                        ),
                        pw.Text(
                          education,
                          style: pw.TextStyle(
                            font: manrope600,
                            fontSize: 12,
                            color: PdfColor.fromInt(0xAA000000),
                          ),
                        ),
                        pw.Text(
                          "INDIA",
                          style: pw.TextStyle(
                            font: manrope600,
                            fontSize: 12,
                            color: PdfColor.fromInt(0xAA000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    ),
  );

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/infiID.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());

  return pdf.save();
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
