import 'package:flutter/material.dart';

class TaskTwo extends StatefulWidget {
  const TaskTwo({super.key});

  @override
  State<TaskTwo> createState() => _TaskTwoState();
}

class _TaskTwoState extends State<TaskTwo> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Canvas draw'),
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: const [
              Tab(
                child: Text("Line"),
              ),
              Tab(
                child: Text("Circle"),
              ),
              Tab(
                child: Text("Rectangle"),
              ),
              Tab(
                child: Text("Triangle"),
              ),
              Tab(
                child: Text("Curves"),
              ),
            ],
          ),
        ),
        body: TabBarView(
            controller: _tabController, children: const [LineWidget(), CircleWidget(), RectangleWidget(), TriangleWidget(), CurvesWidget()]));
  }
}

/// line widgets
class LineWidget extends StatelessWidget {
  const LineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePaint(),
      child: Container(),
    );
  }
}

class LinePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()..strokeWidth = 3.0;
    Offset p1 = Offset(10.0, size.height / 2);
    Offset p2 = Offset(size.width - 10, size.height / 2);
    canvas.drawLine(p1, p2, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// circle widgets
class CircleWidget extends StatelessWidget {
  const CircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePaint(),
      child: Container(),
    );
  }
}

class CirclePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
    Offset p1 = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(p1, 100, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// Rectangle widgets
class RectangleWidget extends StatelessWidget {
  const RectangleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RectanglePaint(),
      child: Container(),
    );
  }
}

class RectanglePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    Rect rect = Rect.fromCenter(center: center, width: 300, height: 200);
    canvas.drawRect(rect, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// Triangle widgets
class TriangleWidget extends StatelessWidget {
  const TriangleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrianglePaint(),
      child: Container(),
    );
  }
}

class TrianglePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
    Path triPath = Path();
    triPath.moveTo(size.width / 2, size.height / 3);
    triPath.lineTo(20, size.height / 2);
    triPath.lineTo(size.width - 20, size.height / 2);
    triPath.close();
    // triPath.lineTo(size.width / 2, size.height / 3);
    canvas.drawPath(triPath, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

/// Triangle widgets
class CurvesWidget extends StatelessWidget {
  const CurvesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvesPaint(),
      child: Container(),
    );
  }
}

class CurvesPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..strokeWidth = 3.0
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
