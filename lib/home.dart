import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'funtions/body.dart';

class SignagePage extends StatefulWidget {
  const SignagePage({super.key});

  @override
  State<SignagePage> createState() => _SignagePageState();
}

class _SignagePageState extends State<SignagePage> {
  final CollectionReference<Map<String, dynamic>> _notes = FirebaseFirestore
      .instance
      .collection('nologo');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _notes
          .orderBy('eventStartDate', descending: true)
          .limit(1)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error: ${snapshot.error}')),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final docs = snapshot.data?.docs ?? [];
        if (docs.isEmpty) {
          return const Scaffold(
            body: Center(child: Text('No signage data found.')),
          );
        }

        final data = docs.first.data();
        final heading = _readString(data, 'heading');
        final subHeading = _readString(data, 'subHeading');
        final paragraph = _readString(data, 'paragraph');
        final footer = _readString(data, 'footer');
        final wifiName = _readString(data, 'wifiName');
        final wifiPassword = _readString(data, 'wifiPassword');
        final eventStartDate = _readDate(data, 'eventStartDate');
        final eventEndDate = _readDate(data, 'eventEndDate');

        return SignageBody(
          heading: heading,
          subHeading: subHeading,
          paragraph: paragraph,
          footer: footer,
          eventStartDate: eventStartDate,
          eventEndDate: eventEndDate,
          wifiName: wifiName,
          wifiPassword: wifiPassword,
        );
      },
    );
  }

  static String _readString(Map<String, dynamic> data, String key) {
    final value = data[key];
    return value is String ? value : '';
  }

  static DateTime _readDate(Map<String, dynamic> data, String key) {
    final value = data[key];

    if (value is Timestamp) {
      return value.toDate();
    }
    if (value is DateTime) {
      return value;
    }
    return DateTime.now();
  }
}
