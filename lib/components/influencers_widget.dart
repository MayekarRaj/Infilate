import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfluencersWidget extends StatefulWidget {
  const InfluencersWidget({Key? key}) : super(key: key);

  @override
  _InfluencersWidgetState createState() => _InfluencersWidgetState();
}

class _InfluencersWidgetState extends State<InfluencersWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 122,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            'assets/images/Group_481.png',
          ).image,
        ),
      ),
    );
  }
}
