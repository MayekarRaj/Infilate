import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:infilate/main_screen.dart';
import 'package:infilate/services/user_provider.dart';
import 'auth/firebase_user_provider.dart';
import 'package:provider/provider.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FFAppState(); // Initialize FFAppState

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<InfilateFirebaseUser> userStream;
  InfilateFirebaseUser? initialUser;
  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();
    userStream = infilateFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  void setLocale(String language) =>
      setState(() => _locale = createLocale(language));
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  // @override
  // Widget build(BuildContext context){
  //   return
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'Infilate',
        localizationsDelegates: [
          FFLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: _locale,
        supportedLocales: const [
          Locale('en'),
          Locale('hi'),
        ],
        theme: ThemeData(brightness: Brightness.light),
        themeMode: _themeMode,
        // home: MainPage(),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // checkUserInDatabase();
              return MainScreen();
            } else {
              return OnboardingSwipingWidget();
            }
          },
        ),
        // initialUser == null || displaySplashImage
        //     ? OnboardingSwipingWidget()
        //     // Container(
        //     //     color: Colors.transparent,
        //     //     child: Builder(
        //     //       builder: (context) => Image.asset(
        //     //         'assets/images/launch_Screen.png',
        //     //         fit: BoxFit.cover,
        //     //       ),
        //     //     ),
        //     //   )
        //     : StreamBuilder<User?>(
        //         stream: FirebaseAuth.instance.authStateChanges(),
        //         builder: (BuildContext context, AsyncSnapshot snapshot) {
        //           if (snapshot.hasData) {
        //             return MainScreen();
        //           } else {
        //             return LoginScreenWidget();
        //           }
        //         },
        //       ),
        // currentUser!.loggedIn
        //     ? MainPage()
        //     : OnboardingSwipingWidget(),
      ),
    );
  }
}
