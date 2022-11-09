import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infilate/index.dart';

import '../flutter_flow/internationalization.dart';

class BrandItem extends StatelessWidget {
  final String id;
  final String image;
  final String label;
  final String pricing;
  final String details;
  final String tnc;
  const BrandItem({
    Key? key,
    required this.image,
    required this.label,
    required this.id,
    required this.pricing,
    required this.details,
    required this.tnc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SellnearndetailWidget(
              id: id,
              name: label,
              img: image,
              details: details,
              pricing: pricing,
              tnc: tnc,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 7,
          vertical: 7,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFF9FBFE),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Color(0xFFE7E7E7),
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 68,
                width: 68,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: image != null
                    ? Image.network(
                        image,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        "assets/images/Group_184.png",
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              // textDirection: Text,
              maxLines: 2,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
