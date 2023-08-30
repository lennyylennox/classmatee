import 'package:flutter/material.dart';

class StudentRow extends StatelessWidget {
  const StudentRow({
    Key? key,
    required this.day,
    required this.subjects,
  }) : super(key: key);

  final String day;
  final List<Map<String, dynamic>> subjects;

  @override
  Widget build(BuildContext context) {
    // Define colors for each section
    const Color dayColor = Colors.blue; // Color for days
    const Color courseColor = Colors.black; // Color for courses
    const Color timeColor = Colors.black; // Color for time

    return Card(
      child: Container(
        color: dayColor.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: dayColor,
                ),
              ),
              const SizedBox(height: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: subjects.map<Widget>((subject) {
                  final subjectName = subject['subjectName'];
                  final classroom = subject['classroom'];
                  final time = subject['time'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subjectName.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: courseColor,
                        ),
                      ),
                      Text(
                        classroom.toString(),
                        style: const TextStyle(
                          color: courseColor,
                        ),
                      ),
                      if (time != null)
                        Text(
                          'Time: $time',
                          style: const TextStyle(
                            color: timeColor,
                          ),
                        ),
                      const Divider(),
                    ],
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
