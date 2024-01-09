// ignore_for_file: prefer_const_constructors

import "dart:math";
import "dart:async";

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

class GameWinningConditions {
  static List<String> playerA = ["paperxrock", "scissorxpaper", "rockxscissor"];
  static List<String> playerB = ["paperxrock", "scissorxpaper", "rockxscissor"];
}

class _HomeState extends State<Home> {
  List<String> options = ["rock", "paper", "scissor"];
  String userChoice = "";
  String appChoice = "default";

  int userScore = 0;
  int appScore = 0;
  String result = "";

  void handleOptionChoosed(int optionIndex) {
    Timer(const Duration(milliseconds: 13), () {
      setState(() {
        appChoice = options[0];
      });
      Timer(const Duration(milliseconds: 13), () {
        setState(() {
          appChoice = options[1];
        });
        Timer(const Duration(milliseconds: 13), () {
          setState(() {
            appChoice = options[2];
          });
          Timer(const Duration(milliseconds: 13), () {
            setState(() {
              appChoice = options[Random().nextInt(options.length)];
              userChoice = options[optionIndex];
            });

            String combination = "${appChoice}x$userChoice";

            if (GameWinningConditions.playerA.contains(combination)) {
              setState(() {
                appScore = appScore + 1;
                result = "APP VENCEU";
              });
            } else if (GameWinningConditions.playerB.contains(combination)) {
              setState(() {
                userScore = userScore + 1;
                result = "VOCÊ VENCEU";
              });
            } else {
              result = "EMPATE";
            }
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Joken Po", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.purple,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.only(top: 32, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text("APP", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text("$appScore", style: TextStyle(fontSize: 18)))
                    ],
                  ),
                  Text(result, style: TextStyle(fontSize: 18)),
                  Column(
                    children: [
                      Text("VOCÊ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text("$userScore", style: TextStyle(fontSize: 18)))
                    ],
                  )
                ],
              )),
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text("App choice:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          switch (appChoice) {
            "rock" => Image.asset("assets/images/rock.png"),
            "paper" => Image.asset("assets/images/paper.png"),
            "scissor" => Image.asset("assets/images/scissor.png"),
            _ => Image.asset("assets/images/default.png"),
          },
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text("Choose one of the options below:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Image.asset("assets/images/rock.png",
                    height: 95,
                    opacity: userChoice == ""
                        ? null
                        : userChoice != options[0]
                            ? AlwaysStoppedAnimation(.7)
                            : null),
                onTap: () {
                  handleOptionChoosed(0);
                },
              ),
              GestureDetector(
                child: Image.asset("assets/images/paper.png",
                    height: 95,
                    opacity: userChoice == ""
                        ? null
                        : userChoice != options[1]
                            ? AlwaysStoppedAnimation(.7)
                            : null),
                onTap: () {
                  handleOptionChoosed(1);
                },
              ),
              GestureDetector(
                child: Image.asset("assets/images/scissor.png",
                    height: 95,
                    opacity: userChoice == ""
                        ? null
                        : userChoice != options[2]
                            ? AlwaysStoppedAnimation(.7)
                            : null),
                onTap: () {
                  handleOptionChoosed(2);
                },
              ),
            ],
          ),
        ]));
  }
}
