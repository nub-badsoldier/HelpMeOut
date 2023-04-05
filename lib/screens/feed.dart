import 'package:flutter/material.dart';

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
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
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
          Container(
            padding: EdgeInsets.only(right: 10, left: 10, top: 10),
            child: Feed(),
          )
        ],
      ),
    );
  }
}

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Post extends StatefulWidget {
  const Post({Key? key}) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
    );
  }
}

