import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter: Primeiros Passos'),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_task),
          ),
        ),
        body: Container(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: const [
                Boxs(
                  color1: Colors.white,
                  color2: Colors.pinkAccent,
                  color3: Colors.lightBlueAccent,
                ),
                Boxs(
                  color1: Colors.red,
                  color2: Colors.deepPurple,
                  color3: Colors.blueAccent,
                ),
                Boxs(
                  color1: Colors.pinkAccent,
                  color2: Colors.amber,
                  color3: Colors.blue,
                ),
                Boxs(
                  color1: Colors.purpleAccent,
                  color2: Colors.white,
                  color3: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Boxs extends StatelessWidget {
  final Color color1;
  final Color color2;
  final Color color3;

  final double height = 140;
  final double width = 100;

  const Boxs(
      {required this.color1,
        required this.color2,
        required this.color3,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            color: color1,
            width: width,
            height: height,
          ),
          Container(
            color: color2,
            width: width,
            height: height,
          ),
          Container(
            color: color3,
            width: width,
            height: height,
          )
        ],
      ),
    );
  }
}
