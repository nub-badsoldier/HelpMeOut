import 'package:flutter/material.dart';
import 'btech.dart';

class Resources extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resources',
      theme: ThemeData(
        primarySwatch: Colors.pink, // Set primary color swatch to pink
        scaffoldBackgroundColor: Colors.white, // Set background color to white
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.pink, // Set button color to pink
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(10.0), // Set button corner radius
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello User'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0), // Add padding around buttons
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BTech(),
                    ),
                  );
                },
                child: Text('B.Tech'),
              ),
              SizedBox(height: 16.0), // Add spacing between buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MTech(),
                    ),
                  );
                },
                child: Text('M.Tech'),
              ),
              SizedBox(height: 16.0), // Add spacing between buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MBA(),
                    ),
                  );
                },
                child: Text('MBA'),
              ),
              SizedBox(height: 16.0), // Add spacing between buttons
              // Add more buttons as needed
            ],
          ),
        ),
      ),
    );
  }
}

class MTech extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('M.Tech'),
      ),
      body: Center(
        child: Text('OOPS! Nothing is found :('),
      ),
    );
  }
}

class MBA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MBA'),
      ),
      body: Center(
        child: Text('OOPS! Nothing is found :('),
      ),
    );
  }
}
