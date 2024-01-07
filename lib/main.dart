// ignore_for_file: prefer_const_constructors

import "package:flutter/material.dart";

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Joken Po",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Joken Po", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.purple,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text("App choice:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Image.asset("assets/images/default.png"),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text("Choose one of the options below:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/rock.png", height: 95),
              Image.asset("assets/images/paper.png", height: 95),
              Image.asset("assets/images/scissor.png", height: 95),
            ],
          )
        ]));
  }
}
