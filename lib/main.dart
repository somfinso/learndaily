import 'package:flutter/material.dart';
import 'package:learndaily/funtions/apbar.dart';
import 'package:learndaily/funtions/body.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: apbar(
          "Sherig – MoESD – Ministry of Education & Skills Development",
          "Department of Education Programmes (DEP)",
          "MoESD, Peling Lam, Kawajangsa, Thimphu, Bhutan Postal Code: 11001 .O. Box: 112",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK4HYyiEsCh-NPOH7_bDIFVm0nyvmePLUGJA&s",
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK4HYyiEsCh-NPOH7_bDIFVm0nyvmePLUGJA&s",
          DateTime(2026, 5, 20),
          DateTime(2026, 5, 25),
        ),
        body: body(
          "Sherig – MoESD – Ministry of Education & Skills Development",
          "Department of Education Programmes (DEP)",
          "MoESD, Peling Lam, Kawajangsa, Thimphu, Bhutan Postal Code: 11001 .O. Box: 112",
          "MoESD, Peling Lam, Kawajangsa, Thimphu, Bhutan Postal Code: 11001 .O. Box: 112",
        ),
      ),
    );
  }
}
