import 'package:flutter/material.dart';
import 'package:helpmeout/main.dart';
import 'package:helpmeout/services/MessFeedback.dart';
import 'package:helpmeout/services/carpooling.dart';
import 'package:helpmeout/services/lostnfound.dart';
import 'package:helpmeout/services/foodordering.dart';

import '../services/services.dart';

class Home_Page extends StatefulWidget {
  Home_Page({Key? key,}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class ServiceIcon {
  final String title;
  final Icon icon;
  final Color color;
  final StatefulWidget page;
  const ServiceIcon(this.title, this.icon, this.color, this.page);
}

class _Home_PageState extends State<Home_Page> {
  List<ServiceIcon> serviceicons = <ServiceIcon>[
    ServiceIcon('Car Pooling', Icon(Icons.car_rental), Colors.cyanAccent,
        CarPoolingPage()),
    ServiceIcon('Lost & Found', Icon(Icons.car_rental), Colors.indigoAccent,
        lostandfoundPage()),
    ServiceIcon('Resources', Icon(Icons.car_rental), Colors.yellowAccent,
        CarPoolingPage()),
    ServiceIcon('Food Order', Icon(Icons.car_rental), Colors.greenAccent,
        FoodorderingPage()),
    ServiceIcon('Buy & Sell', Icon(Icons.car_rental), Colors.purpleAccent,
        CarPoolingPage()),
    ServiceIcon(
        'Bus Book', Icon(Icons.car_rental), Colors.redAccent, CarPoolingPage()),
    ServiceIcon('Mess Feedback', Icon(Icons.car_rental), Colors.redAccent,
        MessFeedBackPage()),
    ServiceIcon(
        'Extra', Icon(Icons.car_rental), Colors.redAccent, CarPoolingPage()),
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
      height: MediaQuery.of(context).size.height,
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyApp()));
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
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              children: [
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
                          MaterialPageRoute(builder: (context) {
                            return serviceicons[index].page;
                          }),
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
          Text(inkwel),
        ],
      ),
    );
  }
}
