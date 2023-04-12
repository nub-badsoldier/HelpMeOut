import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpmeout/components/post.dart';
import 'package:helpmeout/screens/addpost.dart';

class Feed_Page extends StatefulWidget {
  const Feed_Page({Key? key}) : super(key: key);

  @override
  State<Feed_Page> createState() => _Feed_PageState();
}

class _Feed_PageState extends State<Feed_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 15),
                height: 80,
                color: Colors.green,
                child: Row(
                  children: [
                    Text(
                      'Feed',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(left: 5, right: 5),
                scrollDirection: Axis.vertical,
                child: Feed(),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 10, bottom: 10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddPost()));
                },
                child: Icon(Icons.add),
              )
            )
          )
        ],
      )
    );
  }
}

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  Stream<QuerySnapshot> feedref = FirebaseFirestore.instance.collection("feeds").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: feedref,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }
        return Column(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Post(
              uid: data['uid'],
              desc: data['desc'],
              likes: data['likes'],
            );
          }).toList(),
        );
      },
    );
  }
}


