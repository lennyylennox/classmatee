import 'package:classmate/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class Departments extends StatelessWidget {
  const Departments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Center(
          child: Column(
            children: [
              Text("Add Departments"),
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
                        hintText: "code",
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
                          "Course Added",
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
                      onPressed: () {
                        //Get.to(Levels());
                      },
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

void showGetXStyleSnackbar(BuildContext context, String title, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
        textColor: Colors.white,
      ),
    ),
  );
}
