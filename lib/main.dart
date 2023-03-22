import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'screens/home.dart';
import 'screens/feed.dart';
import 'screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'services/services.dart';

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
      home: Gsign(),
    );
  }
}

class Gsign extends StatefulWidget {
  @override
  State<Gsign> createState() => _GsignState();
}

class _GsignState extends State<Gsign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Service',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            )
          ],
        ),
      ),
    );
  }
}
