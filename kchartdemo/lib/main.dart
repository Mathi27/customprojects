import 'package:flutter/material.dart';
import 'package:k_chart/k_chart_widget.dart';

void main() {
  runApp(ChartDemo());
}

class ChartDemo extends StatefulWidget {
  const ChartDemo({super.key});

  @override
  State<ChartDemo> createState() => _ChartDemoState();
}

class _ChartDemoState extends State<ChartDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Chart Demo"),
        ),
        body:  ,
      ),
    );
  }
}
