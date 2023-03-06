import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practiceapi/Modal.dart';
import 'package:shimmer_image/shimmer_image.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

Future<DogModel?> getphoto() async {
  final response =
      await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
  if (response.statusCode == 200) {
    return DogModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load the album');
  }
}

class _MyAppState extends State<MyApp> {
  late Future<DogModel?> futureDog;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      futureDog = getphoto();
    });
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Api Checking"),
        ),
        body: Container(
          child: FutureBuilder(
            future: futureDog,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.network(
                        //   '${snapshot.data!.message}',
                        //   width: 250,
                        //   height: 250,
                        // ),
                        ProgressiveImage(
                            image: '${snapshot.data!.message}',
                            height: 150,
                            width: 150),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Status Code :${snapshot.data!.status}'),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            getphoto();
                          },
                          child: Text("Generate"),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                return Text('${snapshot.error}');
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
