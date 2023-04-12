import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'FirstPage.dart';

class Service {
  final _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await _auth.signInWithCredential(authCredential);
      User? user = result.user;
      print(user);
      print("########");
      print(user?.email);
      print(user?.photoURL);
      if (result != null) {
        final userInst = FirebaseFirestore.instance.collection("user");
        final query = userInst.where(userInst.doc().id, isEqualTo: user?.uid);
        query.get().then((querySnapshot) {
          if (querySnapshot.docs.length == 0) {
            final uploadData = <String, dynamic> {
              'name' : user?.displayName,
              'photourl' : user?.photoURL,
              'email' : user?.email,
            };
            userInst.doc(user?.uid).set(uploadData);
          }
        },
          onError: (e) => null,
        );
        // Navigator.pushReplacement(context,
        //     MaterialPageRoute(builder: (context) => const FirstPage()));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => FirstPage()));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }

  String? getDetails() {
    if (_auth.currentUser?.email != null) return _auth.currentUser?.email;
  }

  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print('Error is signing out');
    }
  }
}
