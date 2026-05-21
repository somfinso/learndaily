import 'package:flutter/material.dart';

AppBar apbarnologo(
  String heading,
  String subHeading,
  String footer,
  DateTime eventStartDate,
  DateTime eventEndDate,
) {
  // Current Date
  DateTime currentDate = DateTime.now();

  // Remaining Days
  int remainingDays = eventEndDate.difference(currentDate).inDays;

  // Date Format Function
  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.blue,

    // Increased Height
    toolbarHeight: 250,

    automaticallyImplyLeading: false,

    // Title Section
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Main Heading
        Text(
          heading,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 5),

        // Sub Heading
        Text(
          subHeading,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.white70),
        ),

        const SizedBox(height: 20),

        // Event Information Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Start Date
            Text(
              "Start : ${formatDate(eventStartDate)}",
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),

            const SizedBox(width: 10),

            const Text(
              "|",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(width: 10),

            // End Date
            Text(
              "End : ${formatDate(eventEndDate)}",
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),

            const SizedBox(width: 10),

            const Text(
              "|",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(width: 10),

            // Remaining Days
            Text(
              remainingDays >= 0
                  ? "Remaining : $remainingDays Days"
                  : "Completed",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.yellow,
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),

        // Footer
        Text(
          footer,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic,
            color: Colors.white60,
          ),
        ),
      ],
    ),
  );
}
