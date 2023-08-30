import 'package:flutter/material.dart';

class TimetableRow extends StatelessWidget {
  const TimetableRow({
    Key? key,
    required this.day,
    required this.departments,
    required this.indentation,
  }) : super(key: key);

  final String day;
  final List<Map<String, dynamic>> departments;
  final double indentation;

  @override
  Widget build(BuildContext context) {
    // Define colors for each section
    const Color dayColor = Colors.blue; // Color for days
    const Color departmentColor = Colors.green; // Color for departments
    const Color levelColor = Colors.orange; // Color for levels
    const Color courseColor = Colors.black; // Color for courses
    const Color timeColor = Colors.black; // Color for time

    return Card(
      child: Container(
        color: dayColor.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.0 + indentation, 16.0, 16.0, 16.0),
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
                children: departments.map((department) {
                  final departmentName = department['departmentName'];
                  final levels = department['levels'];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        departmentName.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: departmentColor,
                        ),
                      ),
                      Column(
                        children: levels.map<Widget>((level) {
                          final levelName = level['levelName'];
                          final subjects = level['subjects'];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                levelName.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: levelColor,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: subjects.map<Widget>((subject) {
                                  final subjectName = subject['subjectName'];
                                  final classroom = subject['classroom'];
                                  final time = subject['time'];
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    ],
                                  );
                                }).toList(),
                              ),
                              const Divider(),
                            ],
                          );
                        }).toList(),
                      ),
                      const Divider(
                        height: 5.0,
                      ),
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
