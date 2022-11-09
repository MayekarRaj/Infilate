import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infilate/constants.dart';
import 'package:infilate/index.dart';
import 'package:infilate/switch_screen.dart';
import 'package:infilate/switch_widget.dart';
import 'package:infilate/traning/training.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PersistentTabController? tabController;

  List<Widget> _buildScreens() {
    return [
      MainScreenWidget(),
      ManageleadWidget(),
      SwitchScreen(
          // onFunction: () {
          //   tabController?.jumpToTab(0);
          // },
          ),
      ReferandEarn1Widget(),
        Training(),
    ];
  }

  // showSheet() {
  List<PersistentBottomNavBarItem> _buildItems() {
    return [
      PersistentBottomNavBarItem(
        // contentPadding: 0,
        icon: ImageIcon(
          AssetImage(
            'assets/images/home.png',
          ),
        ),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage(
            'assets/images/lead.png',
          ),
        ),
        title: ("Lead"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0,
        iconSize: 30,
        icon:
            // Icon(
            //   Icons.percent,
            //   color: Colors.white,
            // ),
            Image.asset(
          "assets/images/peer-to-peer.png",
          height: 25,
          width: 25,
        ),
        // ImageIcon(
        //   AssetImage(
        //     'assets/images/main.png',
        //   ),
        // ),
        // title: ("Home"),
        activeColorPrimary: Color(0xFF01213A),
        inactiveColorPrimary: CupertinoColors.activeGreen,
        // onPressed: (ctx) async {
        //   await showModalBottomSheet(
        //     context: ctx!,
        //     builder: (_) {
        //       return SwitchWidget();
        //     },
        //   );
        // }
        // onPressed: showSheet()
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage(
            'assets/images/referral.png',
          ),
        ),
        title: ("Refferal"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
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
        title: ("Training"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  Future checkUserInDatabase(dynamic context) async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    final DocumentSnapshot? userDoc = await FirebaseFirestore.instance
        .collection("infilateAppUsers")
        .doc(currentUser.uid)
        .get();
    print(currentUser.uid);
    // print(userDoc.);
    if (userDoc!.exists == false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => CreateProfileWidget()));
      // return CreateProfileWidget();
    }
  }

  // showSheet() async {
  //   await showModalBottomSheet(
  //     context: context,
  //     builder: (_) {
  //       return SwitchWidget();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print("tttttttttttttt");
          print(snapshot.data);
          // print(snapshot.data.user);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: title,
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text("Something went wrong!"),
            );
          } else if (snapshot.hasData) {
            // final DocumentSnapshot? userDoc = await FirebaseFirestore
            //             .instance
            //             .collection("infilateAppUsers")
            //             .doc(snapshot.data.user.uid)
            //             .get()
            checkUserInDatabase(context);
            // tabController.
            return PersistentTabView(
              context,
              controller: tabController,
              screens: _buildScreens(),
              items: _buildItems(),
              navBarHeight: 70,
              floatingActionButton: Container(),
              navBarStyle: NavBarStyle.style15,
            );
          } else {
            return OnboardingSwipingWidget();
          }
        },
      ),
    );
  }
}
