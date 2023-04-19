import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpmeout/screens/FirstPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // Wait for 3 seconds, then navigate to the home page
    Timer(Duration(seconds: 2), () {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Gsign()),
        );
      }else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => FirstPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                color: Color(0xFF9EA8C7),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(150),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Color(0xCC68B8D8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(150),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Logo.jpg',
                  height: 200,
                ),
                SizedBox(height: 16),
                Text(
                  'IIITA Service Sharing',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple[800],
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Gsign extends StatefulWidget {
  @override
  State<Gsign> createState() => _GsignState();
}

class _GsignState extends State<Gsign> {
  @override
  bool isLoading = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'IIITA Service Sharing',
        ),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Logo.jpg',
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 50)),
                onPressed: () {
                  Service variable = Service();
                  variable.signup(context);
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                label: const Text('Sign in with Google'),
              ),
            ),
          ]
        )
      ),
    );
  }
}
