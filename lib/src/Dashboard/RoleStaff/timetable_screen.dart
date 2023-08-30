import 'package:flutter/material.dart';
import 'package:classmate/src/Dashboard/RoleStaff/timetable_row.dart';

class TimetableScreen extends StatelessWidget {
  TimetableScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> timetable = [
    {
      'day': 'Monday',
      'departments': [
        {
          'departmentName': 'Department of Computer Engineering',
          'levels': [
            {
              'levelName': ' Level 200',
              'subjects': [
                {
                  'subjectName': 'Basic Electronics',
                  'classroom': 'E 9',
                  'time': '7:30 - 9:30',
                },
              ]
            },
            {
              'levelName': 'Level 100',
              'subjects': [
                {
                  'subjectName': 'Introduction to Software Engineering',
                  'classroom': 'SF-F1',
                  'time': '10:30 - 12:30',
                },
              ],
            },
          ],
        },
      ],
    },
    {
      'day': 'Wednesday',
      'departments': [
        {
          'departmentName': 'Department of Computer Engineering',
          'levels': [
            {
              'levelName': 'Level 400',
              'subjects': [
                {
                  'subjectName': 'Computer Vision & Robotics',
                  'classroom': 'EW-S1',
                  'time': '11:30 - 1:30',
                },
              ],
            },
          ],
        },
        {
          'departmentName': 'For All Engineering Students',
          'levels': [
            {
              'levelName': 'Level 300',
              'subjects': [
                {
                  'subjectName': 'Numerical Methods',
                  'classroom': 'Central Cafteria',
                  'time': '11:30 - 1:30',
                },
              ]
            },
          ]
        }
      ],
    },
    {
      'day': 'Thursday',
      'departments': [
        {
          'departmentName': 'For All Engineering Students',
          'levels': [
            {
              'levelName': 'Level 300',
              'subjects': [
                {
                  'subjectName': 'Numerical Methods - tutorial',
                  'classroom': 'SF-F1',
                  'time': '9:30 - 12:30',
                },
              ]
            },
          ]
        },
        {
          'departmentName': 'Department of Computer Engineering',
          'levels': [
            {
              'levelName': 'Level 400',
              'subjects': [
                {
                  'subjectName': 'Computer Vision & Robotics',
                  'classroom': 'Huawei Lab',
                  'time': '1:30 - 4:30',
                },
              ],
            },
          ],
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
          final departments = timetable[index]['departments'];
          return TimetableRow(
              day: day, departments: departments, indentation: 0);
        },
      ),
    );
  }
}
