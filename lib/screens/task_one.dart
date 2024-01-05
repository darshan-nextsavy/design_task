import 'dart:developer';

import 'package:circular_seek_bar/circular_seek_bar.dart';
import 'package:flutter/material.dart';

class TaskOne extends StatefulWidget {
  const TaskOne({super.key});

  @override
  State<TaskOne> createState() => _TaskOneState();
}

class _TaskOneState extends State<TaskOne> {
  List<Map<String, dynamic>> contribution = [
    {"price": 15000, "persentage": (15000 * 100) / 25000, "salary_type": "Montly salary", "color": Colors.red},
    {"price": 7000, "persentage": (10000 * 100) / 25000, "salary_type": "Other salary", "color": Colors.green},
    {"price": 3000, "persentage": (10000 * 100) / 25000, "salary_type": "Saving salary", "color": Colors.blue},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.purple[900],
      // ),
      body: Container(
        color: Colors.purple[900],
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 66,
            ),
            const Text(
              "Buy a dream House",
              style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                padding: const EdgeInsets.all(16),
                child: const CircularSeekBar(
                  width: double.infinity,
                  interactive: false,
                  height: 250,
                  progress: 25000,
                  maxProgress: 50000,
                  minProgress: 0,
                  barWidth: 6,
                  progressColor: Colors.white,
                  sweepAngle: 270,
                  startAngle: 45,
                  strokeCap: StrokeCap.round,
                  animation: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.home_rounded,
                        color: Colors.white,
                        size: 120,
                      ),
                      Text(
                        "\$25,000",
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text("You saved", style: TextStyle(color: Colors.white54, fontSize: 18, fontWeight: FontWeight.normal))
                    ],
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  5,
                  (index) => Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(color: index == 0 ? Colors.white : Colors.white54, borderRadius: BorderRadius.circular(5)),
                      )).toList(),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 48),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Goal", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w700)),
                      Text("by Jan 2024", style: TextStyle(color: Colors.white54, fontSize: 16, fontWeight: FontWeight.w600))
                    ],
                  ),
                  Text("\$50,000", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700))
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blueAccent[700],
              ),
              child: const Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Need more savings", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                      Text("\$25,000", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600))
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Monthly Saving Projection", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                      Text("\$250", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600))
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(48),
              decoration: const BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Contributions",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Show History",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 10,
                    child: Stack(
                      // Row(
                      // mainAxisSize: MainAxisSize.max,
                      children: List.generate(contribution.length, (index) {
                        int price = 0;
                        for (int i = index; i < contribution.length; i++) {
                          price += contribution[i]['price'] as int;
                        }

                        return Positioned(
                          left: index == 0
                              ? 0
                              : ((MediaQuery.of(context).size.width - 96) - ((MediaQuery.of(context).size.width - 96) * price) / 25000),
                          child: Container(
                            decoration: BoxDecoration(
                                color: contribution[index]['color'],
                                borderRadius: BorderRadius.only(
                                    topLeft: index == 0 ? const Radius.circular(5) : const Radius.circular(0),
                                    bottomLeft: index == 0 ? const Radius.circular(5) : const Radius.circular(0),
                                    topRight: const Radius.circular(5),
                                    bottomRight: const Radius.circular(5))),
                            height: 10,
                            width: ((MediaQuery.of(context).size.width - 96) * contribution[index]['price']) / 25000 + 2,
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
