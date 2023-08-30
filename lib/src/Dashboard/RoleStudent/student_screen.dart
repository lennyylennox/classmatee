import 'package:flutter/material.dart';
import 'package:classmate/src/Dashboard/RoleStudent/student_row.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> timetable = [
    {
      'day': 'Tuesday',
      'subjects': [
        {
          'subjectName': 'Security in Computer Systems',
          'classroom': 'EW-S2',
          'time': '7:30 - 9:30',
        },
        {
          'subjectName': 'Wireless Communication Systems',
          'classroom': 'EW-S1',
          'time': '12:30 - 2:30',
        },
        {
          'subjectName': 'Advanced Computer Architecture',
          'classroom': 'EW-S2',
          'time': '2:30 - 4:30',
        },
      ],
    },
    {
      'day': 'Wednesday',
      'subjects': [
        {
          'subjectName': 'Wireless Communication Networks - lab',
          'classroom': 'Huawei Lab',
          'time': '8:30 - 11:30',
        },
        {
          'subjectName': 'Computer Vision & Robotics',
          'classroom': 'EW-S1',
          'time': '11:30 - 1:30',
        },
        {
          'subjectName': 'Principles of Management and Entrepreunership',
          'classroom': 'NNB-1',
          'time': '5:30 - 7:30',
        },
      ],
    },
    {
      'day': 'Thursday',
      'subjects': [
        {
          'subjectName': 'Security In Computer Systems',
          'classroom': 'Computer Lab',
          'time': '7:30 - 10:30',
        },
        {
          'subjectName': 'Computer Vision & Robotics',
          'classroom': 'Huawei Lab',
          'time': '10:30 - 1:30',
        },
        {
          'subjectName': 'Advanced Computer Architecture',
          'classroom': 'Huawei Lab',
          'time': '1:30 - 4:30',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: timetable.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          final day = timetable[index]['day'];
          final subjects = timetable[index]['subjects'];
          return StudentRow(day: day, subjects: subjects);
        },
      ),
    );
  }
}
