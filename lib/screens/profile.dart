import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Implement your edit button functionality here
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        AssetImage('assets/images/profile_picture.jpg'),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('ID', '12345'),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('Email', 'first@gmail.com'),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('Batch', '2019-2023'),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('Hostel', 'ABC'),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('Blood Group', 'O+'),
          ),
          SizedBox(height: 25.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.orange[100],
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.all(10.0),
            child: _buildProfileInfo('Contact', '1234567890'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(fontSize: 16.0),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 20.0),
        ),
      ],
    );
  }
}
