import 'package:flutter/material.dart';
import 'package:learndaily/funtions/body.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: apbarnologo(
        //   "Annual Conference 2026",
        //   "Department of Education",
        //   "",
        //   DateTime(2026, 5, 20),
        //   DateTime(2026, 5, 30),
        // ),
        body: SignageBody(
          heading: "Annual Conference Annual Conference",
          subHeading:
              "Education for Future Annual Conference Annual Conference",
          paragraph:
              "This conference focuses on innovation and learning.Annual Conference Annual Conference",
          footer: "Organized by Ministry of Education",
          eventStartDate: DateTime(2026, 5, 21),
          eventEndDate: DateTime(2026, 5, 29),
          wifiName: "Yarkay IHCL Seleqtions",
          wifiPassword: "seleqtions",
        ),
        // SignageBody(
        //   "Annual Conference Annual Conference",
        //   "Education for Future Annual Conference Annual Conference",
        //   "This conference focuses on innovation and learning.Annual Conference Annual Conference",
        //   "Organized by Ministry of Education",
        //   DateTime(2026, 5, 20),
        //   DateTime(2026, 5, 25),
        // ),
      ),
    );
  }
}
