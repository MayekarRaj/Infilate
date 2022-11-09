import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infilate/referand_earn1/referand_earn1_widget.dart';
import 'package:infilate/switch_screen.dart';
import 'package:infilate/traning/training.dart';

import 'constants.dart';
import 'create_profile/create_profile_widget.dart';
import 'main_screen/main_screen_widget.dart';
import 'managelead/managelead_widget.dart';
import 'refer_and_earn/refer_and_earn_widget.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentindex = 0;
  final screens = [
    MainScreenWidget(),
    ManageleadWidget(),
    SwitchScreen(),
    ReferandEarn1Widget(),
    Training(),
  ];

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => SwitchScreen()));
        },
        // onPressed: _incrementCounter,
        // tooltip: 'Increment',
        backgroundColor: Color(0xFF01213A),
        child: Image.asset(
          "assets/images/peer-to-peer.png",
          height: 25,
          width: 25,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentindex,
            onTap: (index) => setState(() {
              currentindex = index;
            }),
            showUnselectedLabels: true,
            unselectedFontSize: 14,
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
            selectedItemColor: CupertinoColors.activeBlue,
            unselectedItemColor: CupertinoColors.systemGrey,
            iconSize: 20,
            selectedIconTheme: IconThemeData(
              size: 20,
            ),
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/home.png',
                  ),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/lead.png',
                  ),
                ),
                label: 'Lead',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/lead.png',
                  ),
                  color: white,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'assets/images/referral.png',
                  ),
                ),
                label: 'Referral',
              ),
              BottomNavigationBarItem(
                icon:
                    // FaIcon(
                    //   FontAwesomeIcons.graduationCap,
                    //   size: 24,
                    // ),
                    ImageIcon(
                  AssetImage(
                    'assets/images/training.png',
                  ),
                ),
                label: 'Training',
              )
            ],
          ),
        ),
      ),
      body: screens[currentindex],
      // body: IndexedStack(
      //   index: currentindex,
      //   children: screens,
      // ),
    );
  }
}
