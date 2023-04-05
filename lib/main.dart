import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      debugShowCheckedModeBanner: false,
    );
  }
}

class Gsign extends StatefulWidget {
  @override
  State<Gsign> createState() => _GsignState();
}

class _GsignState extends State<Gsign> {
  @override
  late TextEditingController textEditingController=TextEditingController();
  late TextEditingController texteditingController2=TextEditingController();
  bool isLoading = false;
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(borderSide: Divider.createBorderSide(context));
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
            Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image.asset(
                'assets/Logo.jpg',
                fit: BoxFit.cover,
              )
            ]
            ),
            TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  border: inputBorder,
                  focusedBorder: inputBorder,
                  enabledBorder: inputBorder,
                  filled: true, contentPadding: EdgeInsets.all(8),
                ),
                keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 20),
            TextField(
              controller: texteditingController2,
              decoration: InputDecoration(
                border: inputBorder,
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                filled: true, contentPadding: EdgeInsets.all(8),
              ),
                keyboardType: TextInputType.visiblePassword),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),
                      ),
                    ),
                    color: Colors.blue),
                child: isLoading
                    ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                )
                    : const Text('Log in'),
              ),
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
