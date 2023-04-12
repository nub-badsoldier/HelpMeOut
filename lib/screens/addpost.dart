import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String desc = '';
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    String postid = '';
    int likes = 0;

    void _addpost() {
      FirebaseFirestore.instance.collection("feeds").add({
        'uid': uid,
        'desc': desc,
        'postid': postid,
        'likes': likes,
      });
      Navigator.of(context).pop();
    }

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
