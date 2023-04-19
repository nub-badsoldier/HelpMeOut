import 'package:flutter/material.dart';
import 'package:helpmeout/main.dart';
import 'package:helpmeout/services/MessFeedback.dart';
import 'package:helpmeout/services/carpooling.dart';
import 'package:helpmeout/services/lostnfound.dart';
import 'package:helpmeout/services/foodordering.dart';
import 'package:helpmeout/services/recources.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/buyandsell.dart';
import '../services/services.dart';

class Home_Page extends StatefulWidget {
  Home_Page({
    Key? key,
  }) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class ServiceIcon {
  final String title;
  final Image icon;
  final Color color;
  final StatefulWidget page;
  ServiceIcon(this.title, this.icon, this.color, this.page);
}

class _Home_PageState extends State<Home_Page> {
  String? getDetails() {
    if (FirebaseAuth.instance.currentUser?.email != null)
      return FirebaseAuth.instance.currentUser?.email;
  }

  String? name = FirebaseAuth.instance.currentUser?.displayName;
  List<ServiceIcon> serviceicons = <ServiceIcon>[
    ServiceIcon('Car Pooling', Image(image: AssetImage('assets/vehicle.png'), width: 34, height: 34), Colors.cyan[200]!,
        CarPoolingPage()),
    ServiceIcon('Lost & Found', Image(image: AssetImage('assets/lost-and-found.png'), width: 34, height: 34), Colors.indigo[200]!,
        lostandfoundPage()),
    ServiceIcon('Resources', Image(image: AssetImage('assets/digital-library.png'), width: 34, height: 34), Colors.yellow[200]!,
        RecourcesPage()),
    ServiceIcon('Food Order', Image(image: AssetImage('assets/delivery-man.png'), width: 34, height: 34), Colors.green[200]!,
        FoodorderingPage()),
    ServiceIcon('Buy & Sell', Image(image: AssetImage('assets/buy.png'), width: 34, height: 34), Colors.purple[200]!,
        Sell()),
    ServiceIcon('Bus Book', Image(image: AssetImage('assets/vehicle.png'), width: 34, height: 34), Colors.red[200]!,
        CarPoolingPage()),
    ServiceIcon('Mess Feedback', Image(image: AssetImage('assets/good-review.png'), width: 34, height: 34), Colors.redAccent,
        MessFeedBackPage()),
    ServiceIcon('Extra', Image(image: AssetImage('assets/lost-and-found.png'), width: 34, height: 34), Colors.redAccent,
        CarPoolingPage()),
  ];
  /*void launchURl(String url) async {
    if(await canLaunch(url) ){
      await launchURL(url);
    } else{
      throw 'Could not launch $url';
    }
  }*/

  String inkwel = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
              padding:
                  EdgeInsets.only(top: 35, left: 15, right: 15, bottom: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.pink,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hello User',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.notifications,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () async {
                              Service service = Service();
                              await service.signOut();
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (BuildContext context) => Gsign()),
                              );
                            },
                            child: Icon(
                              Icons.logout,
                              size: 30,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(Icons.search, size: 24),
                      ),
                    ),
                  )
                ],
              )),
          Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child:  Column(
                  children: [
                    Image.asset(
                      'assets/face.gif',
                      height: MediaQuery.of(context).size.width * 0.8,
                      width: MediaQuery.of(context).size.width * 0.8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Services',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              inkwel = 'Pressed See All';
                            });
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.pink),
                          ),
                        )
                      ],
                    ),
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: serviceicons.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => serviceicons[index].page
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: serviceicons[index].color,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: serviceicons[index].icon,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                serviceicons[index].title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
