import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  String? uid;
  String? desc;
  int? likes;
  Post({Key? key, this.uid, this.desc, this.likes}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var userName = '';
  var userPhotoUrl = '';

  bool loaded = false;

  void getUserData() async {
    final docRef = await FirebaseFirestore.instance.collection("user").doc(widget.uid);
    docRef.get().then((DocumentSnapshot doc) {
      final userdata = doc.data() as Map<String, dynamic>;
      userName = userdata['name'];
      userPhotoUrl = userdata['photourl'];
      setState(() {
        loaded = true;
      });
    },
        onError: (e) => print("Error getting document: $e")
    );
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!loaded) {
      return Container();
    }
    else
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
                    userPhotoUrl,
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
