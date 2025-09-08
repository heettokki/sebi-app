import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/sebi_logo.png',
          fit: BoxFit.cover,
          height: 60,
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: const Color.fromARGB(255, 243, 134, 45),
              child: CircleAvatar(
                radius: 21,
                backgroundColor: const Color.fromARGB(255, 218, 122, 154),
                child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: const Color.fromARGB(255, 85, 83, 83),
                    size: 25,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // Learner Level Card Widget
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFB940),
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 130,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 5.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Learner Level',
                          style: TextStyle(
                            color: Colors.white70,
                            fontFamily: 'Nunito',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 0.1),
                        Text(
                          'Liso',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    margin: const EdgeInsets.only(right: 16.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.wb_sunny_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(width: 6),
                        Text(
                          '30',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Nunito',
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // LESSON PROGRESS WIDGET
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35.0,
              vertical: 35.0,
            ),
            child: Column(
              children: [
                // LESSON 1
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon + connector
                    SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/lesson1');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: /*replace with learner progress logic */
                                        true
                                        ? Color(0xFFFFB940)
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.waving_hand,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.check_circle,
                                  color: /*replace with learner progress logic */
                                      true ? Colors.green : Colors.red,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          // Connector below icon
                          LessonProgressConnector(
                            color: /*replace with learner progress logic */ true
                                ? Colors.green
                                : Colors.red,
                            dashed: false, // solid line for completed
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Texts
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/lesson1');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(
                            "Lesson 1",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: /*replace with learner progress logic */
                                  true
                                  ? Color(0xFFFFB940)
                                  : Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            "Greetings and Introduction",
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: /*replace with learner progress logic */
                                  true
                                  ? Color(0xFFFFB940)
                                  : Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // LESSON 2
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/lesson2');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: /*replace with learner progress logic */
                                        true
                                        ? Color(0xFFFFB940)
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.volunteer_activism,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.radio_button_checked,
                                  color: /*replace with learner progress logic */
                                      true ? Colors.red : Colors.red,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                          LessonProgressConnector(
                            color: /*replace with learner progress logic */
                                false ? Colors.green : Colors.red,
                            dashed: true, // broken line for ongoing
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          "Lesson 2",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: /*replace with learner progress logic */ true
                                ? Color(0xFFFFB940)
                                : Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          "Basic Courtesy",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: /*replace with learner progress logic */ true
                                ? Color(0xFFFFB940)
                                : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // LESSON 3
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 60,
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/lesson3');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: /*replace with learner progress logic */
                                        false
                                        ? Color(0xFFFFB940)
                                        : Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.06),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.white.withOpacity(
                                              0.8,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '2',
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.white.withOpacity(
                                              0.8,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '3',
                                          style: TextStyle(
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.white.withOpacity(
                                              0.8,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          "Lesson 3",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: /*replace with learner progress logic */
                                false
                                ? Color(0xFFFFB940)
                                : Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          "Numbers",
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            color: /*replace with learner progress logic */
                                false
                                ? Color(0xFFFFB940)
                                : Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      backgroundColor: Colors.white,
    );
  }
}

// Lesson Progress Item Widget
class LessonProgressItem extends StatelessWidget {
  final IconData? icon;
  final Color iconBg;
  final String title;
  final String subtitle;
  final Color titleColor;
  final Color subtitleColor;
  final bool completed;
  final bool isCurrent;
  final Widget iconWidget;
  final Color indicatorColor;
  final VoidCallback onTap; // Add onTap callback

  const LessonProgressItem({
    super.key,
    this.icon,
    required this.iconBg,
    required this.title,
    required this.subtitle,
    required this.titleColor,
    required this.subtitleColor,
    required this.completed,
    required this.isCurrent,
    required this.iconWidget,
    required this.indicatorColor,
    required this.onTap, // Require onTap in the constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Trigger onTap callback
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon and indicator
          Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: iconBg,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: iconWidget),
                  ),
                  Positioned(
                    bottom: -8,
                    left: 0,
                    right: 0,
                    child: completed
                        ? Icon(
                            Icons.check_circle,
                            color: indicatorColor,
                            size: 20,
                          )
                        : isCurrent
                        ? Icon(
                            Icons.radio_button_checked,
                            color: indicatorColor,
                            size: 20,
                          )
                        : Icon(Icons.circle, color: indicatorColor, size: 16),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Texts
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: titleColor,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: subtitleColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LessonProgressConnector extends StatelessWidget {
  final Color color;
  final bool dashed;

  const LessonProgressConnector({
    super.key,
    required this.color,
    this.dashed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 70,
      alignment: Alignment(0.0, 0.0),
      child: CustomPaint(
        painter: _ConnectorPainter(color: color, dashed: dashed),
        size: const Size(2, 32),
      ),
    );
  }
}

class _ConnectorPainter extends CustomPainter {
  final Color color;
  final bool dashed;

  _ConnectorPainter({required this.color, this.dashed = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    if (dashed) {
      double dashHeight = 6, dashSpace = 6, startY = 0;
      while (startY < size.height) {
        canvas.drawLine(
          Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashHeight),
          paint,
        );
        startY += dashHeight + dashSpace;
      }
    } else {
      canvas.drawLine(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
