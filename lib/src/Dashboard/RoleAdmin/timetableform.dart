// ignore_for_file: unused_field

import 'package:classmate/src/Dashboard/RoleAdmin/schedulingpage.dart';
import 'package:flutter/material.dart';

class TimetableForm extends StatefulWidget {
  const TimetableForm({super.key});

  @override
  State<TimetableForm> createState() => _TimetableFormState();
}

class _TimetableFormState extends State<TimetableForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _timetableName = '';
  String _year = '';
  String? _semester;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the timetable name';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _timetableName = value;
              });
            },
            decoration: InputDecoration(labelText: "Timetable Name"),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the year';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _year = value;
              });
            },
            decoration: InputDecoration(labelText: "Year"),
          ),
          DropdownButtonFormField<String>(
            value: _semester,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a semester';
              }
              return null;
            },
            decoration: InputDecoration(labelText: "Semester"),
            items: <String>['First Semester', 'Second Semester']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _semester = newValue;
              });
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SchedulingPage(),
                  ),
                );
              }
            },
            child: Text("Continue"),
          ),
        ],
      ),
    );
  }
}
