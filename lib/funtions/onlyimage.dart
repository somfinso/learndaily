import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnlyImagePage(),
    );
  }
}

class OnlyImagePage extends StatelessWidget {
  const OnlyImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('onlyimage').snapshots(),

        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          // Error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          // Empty
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No Images Found",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            );
          }

          return PageView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: snapshot.data!.docs.length,

            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index];

              // Firestore Fields
              String imageUrl = data['image'].toString().trim();

              String signage = data['sinage'].toString().trim();

              String description = data['description'].toString().trim();
              print(data["image"]);

              return Stack(
                fit: StackFit.expand,

                children: [
                  // Fullscreen Image
                  Image.network(
                    imageUrl,

                    fit: BoxFit.cover,

                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }

                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    },

                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.black,

                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white,
                            size: 100,
                          ),
                        ),
                      );
                    },
                  ),

                  // Dark Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                  ),

                  // Text Content
                  Positioned(
                    bottom: 50,
                    left: 30,
                    right: 30,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        // SIGNAGE TITLE
                        Text(
                          signage,

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),

                        const SizedBox(height: 15),

                        // DESCRIPTION
                        Text(
                          description,

                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 22,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
