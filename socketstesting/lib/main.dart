import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main(List<String> args) {
  runApp(SocketsTesting());

  /// connecting to the socket server
}

class SocketsTesting extends StatefulWidget {
  const SocketsTesting({super.key});

  @override
  State<SocketsTesting> createState() => _SocketsTestingState();
}

class _SocketsTestingState extends State<SocketsTesting> {
  @override
  void initState() {
    super.initState();
    IO.Socket socket = IO.io('http://192.168.1.67:8080', <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((_) {
      print(
          '---------------------connected to naveen backend-------------------');
    });
    socket.on("message", (data) => print(data));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sockets io"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Dummy Data",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
