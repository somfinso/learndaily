import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'body.dart';

/// Page that shows the signage without any additional logo decorations.
class NoLogoPage extends StatelessWidget {
  const NoLogoPage({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final heading = data['heading'] is String ? data['heading'] as String : '';
    final subHeading = data['subHeading'] is String
        ? data['subHeading'] as String
        : '';
    final paragraph = data['paragraph'] is String
        ? data['paragraph'] as String
        : '';
    final footer = data['footer'] is String ? data['footer'] as String : '';
    final wifiName = data['wifiName'] is String
        ? data['wifiName'] as String
        : '';
    final wifiPassword = data['wifiPassword'] is String
        ? data['wifiPassword'] as String
        : '';

    DateTime eventStartDate = DateTime.now();
    DateTime eventEndDate = DateTime.now();

    final es = data['eventStartDate'];
    final ee = data['eventEndDate'];
    if (es is DateTime) eventStartDate = es;
    if (ee is DateTime) eventEndDate = ee;
    if (es is Timestamp) eventStartDate = es.toDate();
    if (ee is Timestamp) eventEndDate = ee.toDate();

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
  }
}

/// Page that shows the signage; placeholder for adding a logo.
class WithLogoPage extends StatelessWidget {
  const WithLogoPage({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    // For now this uses the same SignageBody; a logo can be added later.
    return NoLogoPage(data: data);
  }
}
