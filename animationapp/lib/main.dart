import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? bigger = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Animation"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: bigger! ? 100 : 600,
              color: Colors.amber,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  bigger = !bigger!;
                });
              },
              child: Text("Press"),
            ),
          ],
        ),
      ),
    );
  }
}
