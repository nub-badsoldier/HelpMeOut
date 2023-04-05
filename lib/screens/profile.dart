import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  String? getDetails() {
    if (FirebaseAuth.instance.currentUser?.email != null)
      return FirebaseAuth.instance.currentUser?.email;
  }

  String? email = FirebaseAuth.instance.currentUser?.email;
  String? name = FirebaseAuth.instance.currentUser?.displayName;
  String? photo = FirebaseAuth.instance.currentUser?.photoURL;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(80),
            child: Text("Profile Page"),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Image.network(
                photo!,
                width: 200,
                height: 200,
              )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(name!),
          ),
          Padding(padding: EdgeInsets.all(10), child: Text(email!))
        ],
      ),
    );
  }
}
