import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helpmeout/components/ProfileData.dart';

class EditProfile extends StatefulWidget {
  final ProfileData profileData;
  EditProfile({super.key, required this.profileData});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _batchController = TextEditingController();
  TextEditingController _hostelController = TextEditingController();
  TextEditingController _bloodGroupController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize text controllers with current profile data
    _idController = TextEditingController(text: widget.profileData.id);
    _emailController = TextEditingController(text: widget.profileData.email);
    _batchController = TextEditingController(text: widget.profileData.batch);
    _hostelController = TextEditingController(text: widget.profileData.hostel);
    _bloodGroupController = TextEditingController(text: 'O+');
    _contactController = TextEditingController(text: widget.profileData.contact);
  }

  @override
  void dispose() {
    // Dispose text controllers when this widget is removed from the tree
    _idController.dispose();
    _emailController.dispose();
    _batchController.dispose();
    _hostelController.dispose();
    _bloodGroupController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  void saveDetails() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    final userInst = FirebaseFirestore.instance.collection("user").doc(uid);
    await userInst.update({
      'id': _idController.text,
      'hostel': _hostelController.text,
      'batch': _batchController.text,
      'contact': _contactController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'ID',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                controller: _idController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),
              Text(
                'Email',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.0),
              Text(
                'Batch',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                controller: _batchController,
              ),
              SizedBox(height: 20.0),
              Text(
                'Hostel',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                controller: _hostelController,
              ),
              SizedBox(height: 20.0),
              Text(
                'Blood Group',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                controller: _bloodGroupController,
              ),
              SizedBox(height: 20.0),
              Text(
                'Contact',
                style: TextStyle(fontSize: 16.0),
              ),
              TextField(
                controller: _contactController,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Save updated profile data here
                  saveDetails();
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
