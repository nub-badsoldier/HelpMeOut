import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post extends StatefulWidget {
  String? uid;
  String? desc;
  int? likes;
  Post({Key? key, this.uid, this.desc, this.likes}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {

  @override
  Widget build(BuildContext context) {
    UserDetail _detail = UserDetail(widget.uid);
    String userphotoUrl = _detail.getPhotoUrl();
    String userName = _detail.getName();

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 5,left: 5, right: 5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 2,
          )
        ),
      ),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Row(
                children: [
                  Image.network(
                    userphotoUrl,
                    width: 30,
                    height: 30,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/avataricon.png',width: 30, height: 30,);
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              )
          ),
          Divider(thickness: 2),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.desc!,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.thumb_up_off_alt),
              SizedBox(width: 2),
              Text(widget.likes.toString(), style: TextStyle(fontSize: 16)),
              Spacer(),
              Icon(Icons.comment),
              SizedBox(width: 2),
              Text('2', style: TextStyle(fontSize: 16)),
            ],
          )
        ],
      ),
    );
  }
}

class UserDetail {
  String userPhotoUrl = '';
  String userName = '';

  UserDetail(String? uid) {
    final docRef = FirebaseFirestore.instance.collection("user").doc(uid);
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        this.userName = data['name'];
        this.userPhotoUrl = data['photourl'];
    });
  }

  String getName() {
    return this.userName;
  }

  String getPhotoUrl() {
    return this.userPhotoUrl;
  }
}
