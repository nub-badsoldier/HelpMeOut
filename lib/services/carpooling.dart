import 'dart:math';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
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
          title: Text('CAR POOLING'),
          centerTitle: true,
          backgroundColor: Color(0xFF68B1D0),
        ),
        body: SingleChildScrollView(
          child: Poolrequest(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => pool()))
          },
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}

class PoolRequest extends StatefulWidget {
  String? source, destination;
  int? fare;
  String? Date, Time, type, contact, name;
  PoolRequest(
      {Key? key,
      this.source,
      this.destination,
      this.fare,
      this.Date,
      this.Time,
      this.type,
      this.contact,
      this.name})
      : super(key: key);

  @override
  State<PoolRequest> createState() => _PoolRequestState();
}

class _PoolRequestState extends State<PoolRequest> {
  _makingPhoneCall() async {
    // var url = Uri.parse(widget.number);
    var url = Uri.parse('tel:' + widget.contact!);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 8,
        color: Color(0xFFffdbe0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 5.0),
            //
            //   child: Text(widget.name!, style: TextStyle(fontSize: 20)),
            // ),
            ListTile(
              leading: InkWell(
                child: Icon(
                  Icons.call,
                ),
                onTap: () {
                  _makingPhoneCall();
                },
              ),
              minLeadingWidth: 213,
              title: Text(widget.name!, style: TextStyle(fontSize: 18)),
              subtitle: Text(widget.contact!, style: TextStyle(fontSize: 18)),
            ),
            // Divider(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 14, right: 14, top: 1, bottom: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FROM',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(widget.source!, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding:
                  const EdgeInsets.only(left: 14, right: 14, top: 1, bottom: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TO',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(widget.destination!, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding:
                  const EdgeInsets.only(left: 14, right: 14, top: 1, bottom: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('DATE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(widget.Date!, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 14, right: 14, top: 1, bottom: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('TIME',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(widget.Time!, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 14, right: 14, top: 1, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('MODE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(widget.type!, style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            // Padding(
            //   padding:
            //       const EdgeInsets.only(left: 8, right: 8, top: 1, bottom: 1),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text('DATE',
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold, fontSize: 20)),
            //           Text(widget.Date!, style: TextStyle(fontSize: 20)),
            //         ],
            //       ),
            //       SizedBox(width: 50),
            //       Padding(
            //         padding: const EdgeInsets.all(2.0),
            //         child: Text(widget.fare.toString(),
            //             style: TextStyle(fontSize: 20)),
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(width: 5),

            // Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: Text(widget.contact!, style: TextStyle(fontSize: 20)),
            // ),
          ],
        ),
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
  Stream<QuerySnapshot> poolref =
      FirebaseFirestore.instance.collection("pool").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: poolref,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            List<Widget> feedlist =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

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
