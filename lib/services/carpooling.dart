import 'package:flutter/material.dart';

class CarpoolingPage extends StatefulWidget {
  @override
  _CarpoolingPageState createState() => _CarpoolingPageState();
}

class _CarpoolingPageState extends State<CarpoolingPage> {
  final _formKey = GlobalKey<FormState>();
  String? _location;
  String? _destination;
  DateTime? _date;
  TimeOfDay? _time;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
        context: context, initialTime: _time ?? TimeOfDay.now());
    if (picked != null && picked != _time) {
      setState(() {
        _time = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carpooling'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a location';
                  }
                  return null;
                },
                onSaved: (value) {
                  _location = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Destination'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a destination';
                  }
                  return null;
                },
                onSaved: (value) {
                  _destination = value;
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _date == null
                          ? 'No date chosen'
                          : 'Date: ${_date!.month}/${_date!.day}/${_date!.year}',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Choose Date'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _time == null
                          ? 'No time chosen'
                          : 'Time: ${_time!.hour}:${_time!.minute}',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text('Choose Time'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Location: $_location, Destination: $_destination, Date: ${_date?.toString() ?? ''}, Time: ${_time?.toString() ?? ''}'),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
