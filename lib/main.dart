import 'package:connecting_firebase/helper/helper_function.dart';
import 'package:connecting_firebase/pages/Nav_bar.dart';
import 'package:connecting_firebase/pages/auth/login_page.dart';
import 'package:connecting_firebase/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "Connecting firebase",
    options: FirebaseOptions(
      apiKey: Constants.apiKey,
      appId: Constants.appId,
      messagingSenderId: Constants.messagingSenderId,
      projectId: Constants.projectId,
    ),
  );

  _requestNotificationPermission();

  runApp(const MyApp());
}

void _requestNotificationPermission() async {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  NotificationSettings settings = await _firebaseMessaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  print(
      'User granted permission: ${settings.authorizationStatus == AuthorizationStatus.authorized}');
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    bool? value = await HelperFunctions.getUserLoggedInStatus();
    if (value != null) {
      setState(() {
        _isSignedIn = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants().primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const Navbar() : const LoginPage(),
    );
  }
}
