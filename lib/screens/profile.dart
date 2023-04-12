import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpmeout/screens/edit_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  String? email = FirebaseAuth.instance.currentUser?.email;
  String? name = FirebaseAuth.instance.currentUser?.displayName;
  String? photo = FirebaseAuth.instance.currentUser?.photoURL;
  String batch = '2021 - 2025';
  String hostel = 'BH - 1';
  String contact = '1234567890';
  String id = 'IIT20XXXXX';

  bool loaded = false;

  void getDetails() async {
    final userRef = FirebaseFirestore.instance.collection("user").doc(uid);
    await userRef.get().then(
      (DocumentSnapshot document) {
        final data = document.data() as Map<String, dynamic>;
        batch = data['batch'];
        hostel = data['hostel'];
        contact = data['contact'];
        id = data['id'];

      }, onError: (e, stackTrace) {
        print(e);
        print(stackTrace);
      }
    );
  }

  @override
  void initState() {
    getDetails();
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => EditProfile())
              );
            },
          ),
        ],
      ),
      body: !loaded
        ? CircularProgressIndicator()
        : ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    // backgroundImage:
                        // AssetImage('assets/avataricon.png'),
                    backgroundImage: NetworkImage(photo!),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    '$name',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('ID', id),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('Email', '$email'),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('Batch', batch),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('Hostel', hostel),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('Blood Group', 'O+'),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('Contact', contact),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(fontSize: 14.0),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );
  }
}
