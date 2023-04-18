import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Post extends StatefulWidget {
  String? uid;
  String? desc;
  int? likes;
  String? postid;
  DateTime? timestamp;
  String? attachment;
  Post({Key? key, this.uid, this.desc, this.likes, this.attachment, this.postid, this.timestamp}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  var userName = '';
  var userPhotoUrl = '';
  var time_stamp = '';

  bool loaded = false;
  bool attachment = false;
  bool showcomment = false;

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

  void getComments() async {
    final feedref = FirebaseFirestore.instance.collection("feed");
    final commentRef = feedref.doc().collection("comments").where("postid", isEqualTo: widget.postid);
  }

  void formatTimeStamp() {
    DateTime dt = widget.timestamp!;
    DateTime current = DateTime.now();
    if (dt.day == current.day && dt.month == current.month) {
      int hourdif = current.hour - dt.hour;
      int mindif = current.minute - dt.minute;
      if (hourdif == 0) {
        time_stamp = '${mindif} minutes ago';
      }else {
        time_stamp = '${hourdif} hours ago';
      }
    }else {
      time_stamp = DateFormat.MMMd().format(dt);
    }
  }

  @override
  void initState() {
    if (widget.attachment != '') {
      attachment = true;
    }
    getUserData();
    formatTimeStamp();
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
      padding: EdgeInsets.only(bottom: 10,left: 10, right: 10),
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
                  ),
                  SizedBox(width: 15),
                  Text(
                    time_stamp,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
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
          SizedBox(height: 5),
          Container(
            child: attachment
            ? Image.network(
              widget.attachment!,

              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
            )
            : SizedBox(height: 5),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.likes = widget.likes! + 1;
                    });
                  },
                  icon: Icon(Icons.thumb_up_off_alt)
              ),
              SizedBox(width: 2),
              Text(widget.likes.toString(), style: TextStyle(fontSize: 16)),
              Spacer(),
              IconButton(
                  onPressed: () {

                  },
                  icon: Icon(Icons.comment),
              ),
              SizedBox(width: 2),
              Text('2', style: TextStyle(fontSize: 16)),
            ],
          ),
          showcomment
            ? Padding(
                padding: EdgeInsets.only(top: 5, left: 20, right: 5),
                child: Column(),
              )
              : Container(),
        ],
      ),
    );
  }
}
