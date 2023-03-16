import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HelpMeOut',
      home: HomePageBody(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HelpMeOut'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  padding: EdgeInsets.all(10),
                  children: List.generate(choices.length, (index) {
                    return Center(
                      child: ServiceCard(choice: choices[index]),
                    );
                  }),
                )
              )
            ],
          ),
        )
      ),
    );
  }
}

class Choice {
  const Choice({required this.title,required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Home', icon: Icons.home),
  Choice(title: 'Setting', icon: Icons.settings),
  Choice(title: 'Contact', icon: Icons.phone),
  Choice(title: 'Map', icon: Icons.pin_drop_sharp),
  Choice(title: 'Wifi', icon: Icons.wifi),
  Choice(title: 'Alarm', icon: Icons.access_alarm),
  Choice(title: 'Balance', icon: Icons.account_balance),
  Choice(title: 'Camera', icon: Icons.add_a_photo_outlined),
  Choice(title: 'Post', icon: Icons.add_box_outlined),
];

class ServiceCard extends StatefulWidget {
  final Choice choice;
  const ServiceCard({Key? key,required this.choice}) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {

  @override
  Widget build(BuildContext context) {
    Color? color = Colors.grey[200];
    return Card(
        color: color,
        child: GestureDetector(
            onTap: () {
              setState() {
                color = Colors.white;
              }
            },
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: Icon(widget.choice.icon, size: 40, color: Colors.blueAccent,)),
                  Text(widget.choice.title),
                ],
              ),
            ),
        )
    );
  }
}
