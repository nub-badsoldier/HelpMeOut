import 'package:flutter/material.dart';

class LostFoundPage extends StatefulWidget {
  const LostFoundPage({Key? key}) : super(key: key);

  @override
  State<LostFoundPage> createState() => _LostFoundPageState();
}

class _LostFoundPageState extends State<LostFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
        appBar: AppBar(
        title: Text('Lost And Found'),
    ),
    body: Center(child: Column(children: <Widget>[
          Container(
          margin: EdgeInsets.all(25),
          child: Text('Visit Website', style: TextStyle(fontSize: 20.0),),
        ),
     ]
    )
    )
        ),
    );
  }
}
