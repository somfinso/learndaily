import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class SignageBody extends StatefulWidget {
  final String heading;
  final String subHeading;
  final String paragraph;
  final String footer;

  // Event Dates
  final DateTime eventStartDate;
  final DateTime eventEndDate;

  // WiFi Information
  final String wifiName;
  final String wifiPassword;

  const SignageBody({
    super.key,
    required this.heading,
    required this.subHeading,
    required this.paragraph,
    required this.footer,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.wifiName,
    required this.wifiPassword,
  });

  @override
  State<SignageBody> createState() => _SignageBodyState();
}

class _SignageBodyState extends State<SignageBody> {
  late Timer timer;

  @override
  void initState() {
    super.initState();

    // Auto Refresh Every Minute
    timer = Timer.periodic(const Duration(minutes: 1), (_) => setState(() {}));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  // Date Formatter
  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    // Current Date
    DateTime now = DateTime.now();

    // Remove Time Portion
    DateTime currentDate = DateTime(now.year, now.month, now.day);

    DateTime startDate = DateTime(
      widget.eventStartDate.year,
      widget.eventStartDate.month,
      widget.eventStartDate.day,
    );

    DateTime endDate = DateTime(
      widget.eventEndDate.year,
      widget.eventEndDate.month,
      widget.eventEndDate.day,
    );

    // Remaining Days
    int remainingDays = endDate.difference(currentDate).inDays;

    // Status
    String statusText;
    Color statusColor;

    if (currentDate.isBefore(startDate)) {
      statusText = "UPCOMING EVENT";
      statusColor = const Color(0xff64B5F6);
    } else if (remainingDays > 0) {
      statusText = "$remainingDays DAYS REMAINING";
      statusColor = const Color(0xffFFD54F);
    } else if (remainingDays == 0) {
      statusText = "FINAL DAY";
      statusColor = const Color(0xffFFB74D);
    } else {
      statusText = "EVENT COMPLETED";
      statusColor = const Color(0xff81C784);
    }

    return Scaffold(
      backgroundColor: const Color(0xff06131C),

      body: Stack(
        children: [
          // ========================================
          // BACKGROUND
          // ========================================
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff07141D),
                  Color(0xff0D2533),
                  Color(0xff123D52),
                ],
              ),
            ),
          ),

          // Decorative Circle Top Right
          Positioned(
            top: -120,
            right: -80,
            child: Container(
              width: 350,
              height: 350,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.04),
              ),
            ),
          ),

          // Decorative Circle Bottom Left
          Positioned(
            bottom: -150,
            left: -100,
            child: Container(
              width: 420,
              height: 420,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withOpacity(0.05),
              ),
            ),
          ),

          // ========================================
          // MAIN CONTENT
          // ========================================
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),

              child: Column(
                children: [
                  // ========================================
                  // TOP STATUS BAR
                  // ========================================
                  glassContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Status
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),

                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.12),

                            borderRadius: BorderRadius.circular(50),

                            border: Border.all(
                              color: statusColor.withOpacity(0.45),
                            ),
                          ),

                          child: Row(
                            children: [
                              Icon(Icons.circle, color: statusColor, size: 12),

                              const SizedBox(width: 10),

                              Text(
                                statusText,
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Current Date
                        Text(
                          "TODAY : ${formatDate(currentDate)}",
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ========================================
                  // MAIN BODY
                  // ========================================
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // Heading
                            ShaderMask(
                              shaderCallback: (bounds) {
                                return const LinearGradient(
                                  colors: [Colors.white, Color(0xffB3E5FC)],
                                ).createShader(bounds);
                              },

                              child: Text(
                                widget.heading.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 78,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  height: 1.2,
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),

                            // Sub Heading
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 18,
                              ),

                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.05),

                                borderRadius: BorderRadius.circular(50),

                                border: Border.all(
                                  color: Colors.white.withOpacity(0.08),
                                ),
                              ),

                              child: Text(
                                widget.subHeading,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 34,
                                  color: Colors.white70,
                                  letterSpacing: 1,
                                  height: 1.5,
                                ),
                              ),
                            ),

                            const SizedBox(height: 70),

                            // Paragraph
                            glassContainer(
                              child: Text(
                                widget.paragraph,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 32,
                                  height: 1.9,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // ========================================
                  // COMPACT INFO BAR
                  // ========================================
                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 18,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),

                      borderRadius: BorderRadius.circular(24),

                      border: Border.all(color: Colors.white.withOpacity(0.08)),
                    ),

                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      spacing: 18,
                      runSpacing: 18,

                      children: [
                        compactInfoCard(
                          title: "WIFI",
                          value: widget.wifiName,
                          icon: Icons.wifi,
                          valueColor: const Color(0xff81D4FA),
                        ),

                        compactInfoCard(
                          title: "PASSWORD",
                          value: widget.wifiPassword,
                          icon: Icons.lock_outline,
                          valueColor: const Color(0xffA5D6A7),
                        ),

                        compactInfoCard(
                          title: "START",
                          value: formatDate(startDate),
                          icon: Icons.calendar_month,
                        ),

                        compactInfoCard(
                          title: "END",
                          value: formatDate(endDate),
                          icon: Icons.event,
                        ),

                        compactInfoCard(
                          title: "STATUS",
                          value: statusText,
                          icon: Icons.timelapse,
                          valueColor: statusColor,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 22),

                  // ========================================
                  // FOOTER
                  // ========================================
                  Text(
                    widget.footer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ========================================
  // GLASS CONTAINER
  // ========================================
  Widget glassContainer({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

        child: Container(
          width: double.infinity,

          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 30),

          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),

            borderRadius: BorderRadius.circular(28),

            border: Border.all(color: Colors.white.withOpacity(0.08)),
          ),

          child: child,
        ),
      ),
    );
  }

  // ========================================
  // COMPACT INFO CARD
  // ========================================
  Widget compactInfoCard({
    required String title,
    required String value,
    required IconData icon,
    Color valueColor = Colors.white,
  }) {
    return Container(
      width: 220,

      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),

        borderRadius: BorderRadius.circular(18),

        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),

      child: Row(
        children: [
          // Icon
          Container(
            width: 46,
            height: 46,

            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(14),
            ),

            child: Icon(icon, color: Colors.white70, size: 24),
          ),

          const SizedBox(width: 14),

          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                    letterSpacing: 1.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  value,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: valueColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
