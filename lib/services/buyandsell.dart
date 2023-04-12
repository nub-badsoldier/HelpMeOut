import 'package:flutter/material.dart';
import 'package:helpmeout/services/sell.dart';

class Sell extends StatefulWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    //   Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => ));
                  },
                  child: Text(
                    'Buy',
                  )),
            ),
          ),
          SizedBox(
            height: 50,
            width: 100,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => sell()));
                },
                child: Text(
                  'Sell',
                )),
          ),
        ],
      ),
    );
  }
}
