import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:random_string/random_string.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  bool image = false;
  String desc = '';
  String? uid = FirebaseAuth.instance.currentUser?.uid;
  String postid = '${randomAlpha(15)}';
  int likes = 0;
  late File imageFile;

  Future getImage() async {
    try {
      final attachment = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (attachment == null) {
        return;
      }
      final attachpath = File(attachment.path);
      setState(() {
        imageFile = attachpath;
      });
    } catch (e) {
      print('Not able to fetch image');
    }
  }

  void _addpost() async {
    var downloadURL = '';
    if (imageFile != null) {
      final storage = FirebaseStorage.instance
          .ref()
          .child('feed_attachments')
          .child(postid);
      ;
      UploadTask uploadTask = storage.putFile(imageFile!);
      downloadURL = await (await uploadTask).ref.getDownloadURL();
    }
    FirebaseFirestore.instance.collection("feeds").add({
      'uid': uid,
      'desc': desc,
      'postid': postid,
      'likes': likes,
      'url': downloadURL,
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a Post'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: TextField(
                expands: true,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Write Something...'
                ),
                onChanged: (text) {
                  desc = text;
                },
              ),
            ),
            InkWell(
              onTap: () {
                getImage();
                setState(() {
                  image = true;
                });
              },
              child: Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  child: image
                      ? Image.file(
                        imageFile,
                        fit: BoxFit.fill,
                      )
                      : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _addpost,
              child: Text('Post')
            )
          ],
        ),
      )
    );
  }
}
