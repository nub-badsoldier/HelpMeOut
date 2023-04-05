import 'package:flutter/material.dart';

class FoodorderingPage extends StatefulWidget {
  const FoodorderingPage({Key? key}) : super(key: key);

  @override
  State<FoodorderingPage> createState() => _FoodorderingState();
}

class _FoodorderingState extends State<FoodorderingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Food Ordering'),
        ),
        body: Column(
          children: [
            BulkOrder(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=> {

          }
        ),
      ),
    );
  }
}

class BulkOrder extends StatefulWidget {
  String? source, destination;
  int? fare;
  DateTime? dateTime;
  BulkOrder({Key? key, this.source, this.destination, this.fare, this.dateTime}) : super(key: key);

  @override
  State<BulkOrder> createState() => _BulkOrderState();
}

class _BulkOrderState extends State<BulkOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all(
          width: 2,
          color: Colors.blueAccent,
        ),
      ),
      child: Column(
        children: [
          Text('UserName', style: TextStyle(fontSize: 20)),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Restaurant', style: TextStyle(fontSize: 20))
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Date', style: TextStyle(fontSize: 20)),
                  Text('Time', style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(width: 50),
              Text('Fare', style: TextStyle(fontSize: 20)),
            ],
          )
        ],
      ),
    );
  }
}
