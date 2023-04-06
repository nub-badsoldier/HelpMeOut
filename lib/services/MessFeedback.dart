import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Column(
          children: [
          Container(
              padding: EdgeInsets.all(16.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: ExternalLinkButton(
                url: 'https://forms.gle/9PkUDiHbB7WNR4aa9',
                buttonText: 'Boys Hostel',
              ),
            ),
          ),
        Container(
          padding: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ExternalLinkButton(
              url: 'https://forms.gle/16RSFgwZ8Tj4MgLg9',
              buttonText: 'Girls Hostel',
            ),
          ),
        ),]
              ),
          ]
          ))
      ),
    );
  }
}
class ExternalLinkButton extends StatelessWidget {
  final String url;
  final String buttonText;

  ExternalLinkButton({required this.url, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
      child: Text(buttonText),
    );
  }
}