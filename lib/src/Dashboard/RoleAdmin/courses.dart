import 'package:classmate/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: Row(
          children: [
            Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: 'AREN'),
                    Tab(text: "BMEN"),
                    Tab(text: "FPEN"),
                    Tab(text: "CPEN"),
                    Tab(text: "MTEN"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  AREN(),
                  BMEN(),
                  CPEN(),
                  FPEN(),
                  MTEN(),
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
            ),
          ],
        ),
      );
}

class AREN extends StatelessWidget {
  const AREN({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TextFormField()],
    );
  }
}

class BMEN extends StatelessWidget {
  const BMEN({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MTEN extends StatelessWidget {
  const MTEN({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FPEN extends StatelessWidget {
  const FPEN({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CPEN extends StatelessWidget {
  const CPEN({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
/**import 'package:classmate/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class Courses extends StatelessWidget {
  const Courses({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: SingleChildScrollView(
          child: Row(
            children: [
              Column(
                children: [
                  Scaffold(
                    appBar: AppBar(
                      bottom: TabBar(
                        isScrollable: true,
                        labelColor: Colors.black,
                        tabs: [
                          Tab(text: 'AREN'),
                          Tab(text: "BMEN"),
                          Tab(text: "FPEN"),
                          Tab(text: "CPEN"),
                          Tab(text: "MTEN"),
                        ],
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        AREN(),
                        BMEN(),
                        CPEN(),
                        FPEN(),
                        MTEN(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: tDefaultSize,
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
              )
            ],
          ),
        ),
      );
}

class AREN extends StatelessWidget {
  const AREN({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class BMEN extends StatelessWidget {
  const BMEN({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MTEN extends StatelessWidget {
  const MTEN({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class FPEN extends StatelessWidget {
  const FPEN({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CPEN extends StatelessWidget {
  const CPEN({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
 */