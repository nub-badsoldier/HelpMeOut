import 'package:flutter/material.dart';
import 'package:helpmeout/services/carpooling.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:helpmeout/services/pool.dart';

class CarPoolingPage extends StatefulWidget {
  const CarPoolingPage({Key? key}) : super(key: key);

  @override
  State<CarPoolingPage> createState() => _CarPoolingPageState();
}

class _CarPoolingPageState extends State<CarPoolingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Car Pooling'),
        ),
        body: SingleChildScrollView(
          child: Poolrequest(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: ()=> {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => pool())
          )
          },
        ),
      ),
    );
  }
}

class PoolRequest extends StatefulWidget {
  String? source, destination;
  int? fare;
  String? Date,Time,type,contact,name;
  PoolRequest({Key? key, this.source, this.destination, this.fare, this.Date,this.Time,this.type,this.contact,this.name}) : super(key: key);

  @override
  State<PoolRequest> createState() => _PoolRequestState();
}

class _PoolRequestState extends State<PoolRequest> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        border: Border.all(
          width: 2,
          color: Colors.blueAccent,
        ),
      ),
      child: Column(
        children: [
          Text(widget.name!, style: TextStyle(fontSize: 20)),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.source!, style: TextStyle(fontSize: 20)),
              Text(widget.destination!, style: TextStyle(fontSize: 20)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.Date!, style: TextStyle(fontSize: 20)),
                  Text(widget.Time!, style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(width: 50),
              Text(widget.fare.toString(), style: TextStyle(fontSize: 20)),

            ],
          ),
          SizedBox(width: 50),
          Text(widget.contact!, style: TextStyle(fontSize: 20)),

          SizedBox(width: 50),
          Text(widget.type!, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class Poolrequest extends StatefulWidget {
  const Poolrequest({Key? key}) : super(key: key);

  @override
  State<Poolrequest> createState() => _PoolrequestState();
}

class _PoolrequestState extends State<Poolrequest> {
  Stream<QuerySnapshot> poolref = FirebaseFirestore.instance.collection("pool").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: poolref,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }else if (snapshot.connectionState == ConnectionState.active
            || snapshot.connectionState == ConnectionState.done) {

          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            List<Widget> feedlist = snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;

              return PoolRequest(
                source: data['source'],
                destination: data['destination'],
                Date: data['date'],
                Time: data['time'],
                type: data['type'],
                contact: data['contact'],
                name: data['name'],
                fare: data['fare'],
              );
            }).toList();
            return Column(children: feedlist);
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }
}
