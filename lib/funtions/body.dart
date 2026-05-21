import 'package:flutter/material.dart';

Container body(
  String heading,
  String subHeading,
  String paragraph,
  String footer,
) {
  return Container(
    width: double.infinity,
    color: Colors.blueAccent,

    child: Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Main Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Heading
              Text(
                heading,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 15),

              // Subheading
              Text(
                subHeading,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 25),

              // Paragraph
              Text(
                paragraph,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 18,
                  height: 1.6,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          // Footer at Bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 20),

            child: Text(
              footer,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.white60,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
