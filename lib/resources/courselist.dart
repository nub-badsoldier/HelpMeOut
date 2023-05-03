import 'package:flutter/material.dart';
import 'package:helpmeout/resources/resourcelist.dart';
import 'package:helpmeout/components/Course.dart';

class Courses extends StatefulWidget {
  List<Course> courselist;
  Courses({Key? key, required this.courselist}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemCount: widget.courselist.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 5, bottom: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResourceList(title: widget.courselist[index].title!, resourcepath: widget.courselist[index].respath!),
                  ),
                );
              },
              child: Text(widget.courselist[index].title!),
            )
          );
        }
      )
    );
  }
}
