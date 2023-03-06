import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:math' show pi;

/// Project : This is the proof of concept app for the animation
void main() {
  runApp(proofOfConcept());
}

class proofOfConcept extends StatefulWidget {
  const proofOfConcept({super.key});

  @override
  State<proofOfConcept> createState() => _proofOfConceptState();
}

class _proofOfConceptState extends State<proofOfConcept>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  late AnimationController _controlle2;
  late Animation<double> _animation2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _controller.repeat();

    ///second animation
    _controlle2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation2 = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controlle2);
    _controlle2.repeat();
  }

  @override
  void dispose() {
    // TODO: implement
    _controller.dispose();
    super.dispose();
    _controlle2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Proof of concept"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  origin: Offset(50, 50),
                  transform: Matrix4.identity()..rotateY(_animation.value),
                  child: Container(
                    height: 100,
                    width: 100,
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            offset: Offset(0, 3),
                            blurRadius: 7,
                            spreadRadius: 5,
                          ),
                        ]),
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controlle2,
                  builder: (context, child) {
                    return Transform(
                      origin: Offset(50, 50),
                      transform: Matrix4.identity()..rotateY(_animation2.value),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.lightGreenAccent,
                                  offset: Offset(0, 3),
                                  blurRadius: 10,
                                  spreadRadius: 5)
                            ]),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
