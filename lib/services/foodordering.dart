import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'order.dart';
import 'package:url_launcher/url_launcher.dart';

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
          title: Text('FOOD ORDER'),
          centerTitle: true,
          backgroundColor: Color(0xFF68B1D0),
        ),
        body: SingleChildScrollView(
          child: Bulkorder(),
        ),
        backgroundColor: Color(0xFFE4F4FD),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => order()))
          },
          backgroundColor: Color(0xFF68B1D0),
        ),
      ),
    );
  }
}

class BulkOrder extends StatefulWidget {
  String? platform, restro,contact,name,date;
  int? itemcnt,fare;
  BulkOrder({Key? key,
    this.name,
    this.platform,
    this.restro,
    this.date,
    this.itemcnt,
    this.fare,
    this.contact})
      : super(key: key);

  @override
  State<BulkOrder> createState() => _BulkOrderState();
}

class _BulkOrderState extends State<BulkOrder> {
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
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.delivery_dining, color: Color(0xFF68B1D0)),
                      SizedBox(width: 10),
                      Text(widget.platform!,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.restaurant, color: Color(0xFF68B1D0)),
                  SizedBox(width: 10),
                  Text(widget.restro!,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.fastfood, color: Color(0xFF68B1D0)),
                      SizedBox(width: 10),
                      Text(widget.itemcnt.toString(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee, color: Color(0xFF68B1D0), size: 24,),
                      SizedBox(width: 5),
                      Text(widget.fare.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.date_range, color: Color(0xFF68B1D0)),
                  SizedBox(width: 10),
                  Text(widget.date!,
                    style: TextStyle(
                        fontSize: 20,
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              ListTile(
                leading: Image.asset('assets/avataricon.png'),
                title: Text(widget.name!,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                subtitle: Text(widget.contact!,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: InkWell(
                  child: Icon(
                    Icons.call,
                    size: 30,
                    color: Colors.green,
                  ),
                  onTap: () {
                    _makingPhoneCall();
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        elevation: 8,
        color: Color(0xFFffdbe0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        // width: MediaQuery.of(context).size.width,
        // margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        // padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        // decoration: BoxDecoration(
        //   color: Colors.lightBlueAccent,
        //   border: Border.all(
        //     width: 2,
        //     color: Colors.blueAccent,
        //   ),
        // ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(widget.name!, style: TextStyle(fontSize: 20)),
            ),
            // Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order via',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('Order from',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding:
              const EdgeInsets.only(left: 8, right: 8, top: 1, bottom: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.platform!, style: TextStyle(fontSize: 20)),
                  Text(widget.restro!, style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding:
              const EdgeInsets.only(left: 8, right: 8, top: 1, bottom: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(widget.date!, style: TextStyle(fontSize: 20)),
                      Text(widget.itemcnt.toString(), style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  SizedBox(width: 50),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(widget.fare.toString(),
                        style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
            ),
            SizedBox(width: 5),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(widget.contact!, style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class Bulkorder extends StatefulWidget {
  const Bulkorder({Key? key}) : super(key: key);

  @override
  State<Bulkorder> createState() => _BulkorderState();
}

class _BulkorderState extends State<Bulkorder> {
  Stream<QuerySnapshot> orderef =
  FirebaseFirestore.instance.collection("order").snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: orderef,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Text('Error');
          } else if (snapshot.hasData) {
            List<Widget> list =
            snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> file =
              document.data() as Map<String, dynamic>;
              print(file['platform']);
              return BulkOrder(
                platform: file['platform'],
                restro: file['restro'],
                date: file['date'],
                itemcnt: file['itemcnt'] as int,
                contact: file['contact'],
                name: file['name'],
                fare: file['fare'] as int,
              );
            }).toList();
            return Column(children: list);
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
