import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

Random random = Random();

double doubleInRange(num start, num end) => random.nextDouble() * (end - start) + start;

class TaskThree extends StatefulWidget {
  const TaskThree({super.key});

  @override
  State<TaskThree> createState() => _TaskThreeState();
}

class _TaskThreeState extends State<TaskThree> with SingleTickerProviderStateMixin {
  late List<Partical> particles;
  late Ticker _tiker;

  @override
  void initState() {
    super.initState();
    particles = List.generate(1, (index) => Partical());
    _tiker = createTicker((elapsed) {
      setState(() {
        particles.add(Partical());
      });
    });
  }

  @override
  void dispose() {
    _tiker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: InkWell(
          onTapDown: (TapDownDetails details) {
            if (!_tiker.isActive) {
              _tiker.start();
            } else {
              _tiker.stop();
            }
          },
          onTapUp: (details) {
            _tiker.stop();
          },
          child: CustomPaint(
            painter: ParticalPaint(particles: particles),
          ),
        ),
      ),
    );
  }
}

class ParticalPaint extends CustomPainter {
  List<Partical> particles;

  ParticalPaint({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.setPosition(particle.x * size.width, particle.y * size.height);
      canvas.drawCircle(
          Offset(particle.x, particle.y),
          15,
          Paint()
            ..strokeWidth = 3.0
            ..color = Color.fromARGB(particle.opacity, 255, 255, 255));

      particle.update();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Partical {
  double x = 0.5;
  double y = 0.9;
  double vx = doubleInRange(-1, 1);
  double vy = doubleInRange(5, 1);
  int opacity = 255;
  Partical();

  update() {
    x -= vx;
    y -= vy;
    opacity -= 5;
  }

  setPosition(double xPos, double yPos) {
    if (x < 1 && y < 1) {
      x = xPos;
      y = yPos;
    }
  }

  // finish() {
  //   return opacity == 0;
  // }
}

// Random
