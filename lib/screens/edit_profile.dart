import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile.dart';

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

  bool _isSendOtp = false;

  /**
  Future<bool> _sendOtp(String phone) async {
    if(_isSendOtp){
      return false;
    }
    _isSendOtp=true;
    Completer<bool> completer = Completer<bool>();
    Timer? timeouttimer;

    User? currentUser = FirebaseAuth.instance.currentUser;

    _auth.verifyPhoneNumber(
      phoneNumber: "+91$phone",
      verificationCompleted: (PhoneAuthCredential credential) async {
        if (currentUser != null) {
          try {
            await currentUser.linkWithCredential(credential);
            Fluttertoast.showToast(msg: "Phone number linked successfully!");
            completer.complete(true);
          } catch (e) {
            Navigator.of(context).pop();
            Fluttertoast.showToast(msg: e.toString());
            completer.complete(false);
          }
        }
      },
      verificationFailed: (FirebaseAuthException e) {

        _phoneController.text = phone;
        Fluttertoast.showToast(msg: e.message!);
        completer.complete(false);
        Navigator.of(context).pop();
      },
      codeSent: (String verificationId, int? resendToken) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            timeouttimer= Timer(Duration(seconds: 60), () {
              Navigator.of(context).pop();
              Fluttertoast.showToast(msg: "OTP timeout");
            });
            return AlertDialog(
              title: Text('Enter OTP'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    String smsCode = _otpController.text.trim();
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: verificationId, smsCode: smsCode);
                    if (currentUser != null) {
                      timeouttimer?.cancel();
                      try {
                        await currentUser.unlink("phone");
                      } catch (e) {
                        print(e.toString());
                      }
                      try {
                        await currentUser.linkWithCredential(credential);
                        Fluttertoast.showToast(msg: "Phone number linked successfully!");
                        completer.complete(true);
                        Navigator.of(context).pop();
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                        completer.complete(false);
                      }
                    }
                  },
                  child: const Text('Verify'),
                ),
              ],
            );
          },
        ).then((value){
          timeouttimer?.cancel();
        });
      },
      timeout: const Duration(seconds: 90),
      codeAutoRetrievalTimeout: (String verificationId) {
      },
    );

    return completer.future;
  }
      **/

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
              Row(
                children: [
                  TextField(
                    controller: _contactController,
                    keyboardType: TextInputType.phone,

                  ),
                  IconButton(
                      onPressed: null,
                      icon: Icon(Icons.verified_outlined, color: Colors.red)
                  )
                ],
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
