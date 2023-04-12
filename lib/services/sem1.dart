import 'package:flutter/material.dart';

class Sem1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
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
                      builder: (context) => Physics(),
                    ),
                  );
                },
                child: Text('Physics'),
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
                      builder: (context) => ITP(),
                    ),
                  );
                },
                child: Text('ITP'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => POC(),
                    ),
                  );
                },
                child: Text('Professional Communication'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LAL(),
                    ),
                  );
                },
                child: Text('Linear Algebra'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FEE(),
                    ),
                  );
                },
                child: Text('Fundamental of Electronics and Communication'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => POM(),
                    ),
                  );
                },
                child: Text('Principal of Management'),
              ),
              SizedBox(height: 16.0),
              //Add spacing between buttons
              // Add more buttons as needed
            ],
          ),
        ),
      ),
    );
  }
}

class Physics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physics'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class ITP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Introduction to Programming'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class POC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Communication'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class LAL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Linear Algebra'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class FEE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fundamental of Electrical and Electronics '),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}

class POM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal of Management'),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0), // Add padding around buttons
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text("OOPS! Nothing is Found :("),
              ]))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {},
      ),
    );
  }
}
