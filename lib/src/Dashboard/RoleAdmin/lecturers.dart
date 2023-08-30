import 'package:classmate/src/Dashboard/RoleAdmin/Departments.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class Lecturers extends StatelessWidget {
  const Lecturers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                // -- BUTTON
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    showGetXStyleSnackbar(
                      context,
                      "Retrieved",
                      "",
                    );
                  },
                  child: Text(
                    "retrieve lecturers from db".toUpperCase(),
                  ),
                ),
              ),
              const SizedBox(
                height: tDefaultSize,
              ),
              Text("Add Lecturer"),
              const SizedBox(
                height: tDefaultSize * 1.5,
              ),
              Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      //controller: controller.email,
                      decoration: InputDecoration(
                        hintText: "name",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: tDefaultSize / 2,
                  ),
                  SizedBox(
                    width: 200,
                    child: TextFormField(
                      //controller: controller.email,
                      decoration: InputDecoration(
                        hintText: "email",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: tDefaultSize * 1.5,
                  ),
                  SizedBox(
                    // -- BUTTON
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        showGetXStyleSnackbar(
                          context,
                          "Lecturer Added",
                          "",
                        );
                      },
                      child: Text(
                        "add".toUpperCase(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: tDefaultSize * 1.5,
                  ),
                  SizedBox(
                    // -- BUTTON
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child: Text(
                        "done".toUpperCase(),
                      ),
                    ),
                  ),
                ],
              ),
              /*const SizedBox(
                height: tDefaultSize * 3,
              ),
              Text("Departments".toUpperCase()),
              const SizedBox(
                height: tDefaultSize * 1.5,
              )*/
            ],
          ),
        ),
      ),
    );
  }
}
