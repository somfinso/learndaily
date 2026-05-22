// import 'package:flutter/material.dart';

// AppBar apbar(
//   String heading,
//   String subHeading,
//   String footer,
//   String leftlogo,
//   String rightlogo,
//   DateTime eventStartDate,
//   DateTime eventEndDate,
// ) {
//   // Current Date
//   DateTime currentDate = DateTime.now();

//   // Total Event Days
//   int totalDays = eventEndDate.difference(eventStartDate).inDays + 1;

//   // Remaining Days
//   int remainingDays = eventEndDate.difference(currentDate).inDays;

//   // Date Format Function
//   String formatDate(DateTime date) {
//     return "${date.day}/${date.month}/${date.year}";
//   }

//   // Same Large Logo Widget
//   Widget logoWidget(String logo) {
//     return Container(
//       width: 130,
//       height: 130,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.white,
//         border: Border.all(color: Colors.black, width: 3),
//         boxShadow: const [
//           BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 3)),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8),
//         child: ClipOval(child: Image.network(logo, fit: BoxFit.cover)),
//       ),
//     );
//   }

//   return AppBar(
//     centerTitle: true,
//     backgroundColor: Colors.blue,

//     // Increased Height
//     toolbarHeight: 350,

//     // Increased Left Width
//     leadingWidth: 150,

//     // Left Logo
//     leading: Padding(
//       padding: const EdgeInsets.all(10),
//       child: Center(child: logoWidget(leftlogo)),
//     ),

//     // Title Section
//     title: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         // Main Heading
//         Text(
//           heading,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),

//         const SizedBox(height: 5),

//         // Sub Heading
//         Text(
//           subHeading,
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontSize: 20, color: Colors.white70),
//         ),

//         const SizedBox(height: 15),

//         // Current Date
//         Text(
//           "Current Date : ${formatDate(currentDate)}",
//           style: const TextStyle(fontSize: 16, color: Colors.white),
//         ),

//         const SizedBox(height: 12),

//         // Event Information Row
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Start Date
//             Text(
//               "Start : ${formatDate(eventStartDate)}",
//               style: const TextStyle(fontSize: 15, color: Colors.white),
//             ),

//             const SizedBox(width: 10),

//             const Text(
//               "|",
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(width: 10),

//             // End Date
//             Text(
//               "End : ${formatDate(eventEndDate)}",
//               style: const TextStyle(fontSize: 15, color: Colors.white),
//             ),

//             const SizedBox(width: 10),

//             const Text(
//               "|",
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(width: 10),

//             // Remaining Days
//             Text(
//               remainingDays >= 0
//                   ? "Remaining : $remainingDays Days"
//                   : "Completed",
//               style: const TextStyle(
//                 fontSize: 15,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.yellow,
//               ),
//             ),
//           ],
//         ),

//         const SizedBox(height: 12),

//         // Total Event Days
//         Text(
//           "Total Event Days : $totalDays Days",
//           style: const TextStyle(fontSize: 15, color: Colors.white),
//         ),

//         const SizedBox(height: 18),

//         // Footer
//         Text(
//           footer,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 15,
//             fontStyle: FontStyle.italic,
//             color: Colors.white60,
//           ),
//         ),
//       ],
//     ),

//     // Right Logo
//     actions: [
//       Padding(
//         padding: const EdgeInsets.all(10),
//         child: Center(child: logoWidget(rightlogo)),
//       ),
//     ],
//   );
// }
