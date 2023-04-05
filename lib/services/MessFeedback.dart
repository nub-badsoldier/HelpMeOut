import 'package:flutter/material.dart';

class MessFeedBackPage extends StatefulWidget {
  const MessFeedBackPage({Key? key}) : super(key: key);

  @override
  State<MessFeedBackPage> createState() => _MessFeedBackState();
}

class _MessFeedBackState extends State<MessFeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Mess Feedback'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: FloatingActionButton(
                child: Text('BH 1', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FloatingActionButton(
                child: Text('BH 2', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FloatingActionButton(
                child: Text('BH 3', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FloatingActionButton(
                child: Text('BH 4', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FloatingActionButton(
                child: Text('BH 5', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FloatingActionButton(
                child: Text('GH 1', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FloatingActionButton(
                child: Text('GH 2', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              child: FloatingActionButton(
                child: Text('GH 3', style: TextStyle(fontSize: 20.0),),
                onPressed: () {},
              ),
            ),
          ]
          ))
      ),
    );
  }
}