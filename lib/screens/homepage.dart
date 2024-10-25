// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import '../utils/gamelogic.dart';
import '../widgets/scorecard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool stateCounter = true;
  Game gameObj = Game();
  int tries = 0;
  int score = 0;
  @override
  void initState() {
    super.initState();
    gameObj.initGame();
    // stateCounter = true;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            scoreCard("Tries", "$tries"),
            scoreCard("Score", "$score"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: SizedBox(
            height: screenWidth,
            width: screenWidth,
            child: GridView.builder(
                itemCount: gameObj.gameImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                itemBuilder: (contxt, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          tries++;
                          gameObj.gameImg![index] = gameObj.cardList[index];
                          gameObj.matchCheck
                              .add({index: gameObj.cardList[index]});
                        });
                        if (gameObj.matchCheck.length == 2) {
                          if (gameObj.matchCheck[0].values.first ==
                              gameObj.matchCheck[1].values.first) {
                            print(true);
                            score += 100;
                            gameObj.matchCheck.clear();
                          } else {
                            print(false);
                            Future.delayed(Duration(milliseconds: 500), () {
                              setState(() {
                                gameObj.gameImg![gameObj.matchCheck[0].keys
                                    .first] = gameObj.unknownCardPath;
                                gameObj.gameImg![gameObj.matchCheck[1].keys
                                    .first] = gameObj.unknownCardPath;
                                gameObj.matchCheck.clear();
                              });
                            });
                          }
                        }
                      },
                      child: (stateCounter == true)
                          ? Container(
                              padding: EdgeInsets.all(18.0),
                              decoration: BoxDecoration(
                                  color: Color(0xffffb46a),
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(gameObj.gameImg![index]),
                                      fit: BoxFit.cover)),
                            )
                          : Container(
                              padding: EdgeInsets.all(18.0),
                              decoration: BoxDecoration(
                                  color: Color(0xffffb46a),
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image:
                                          AssetImage(gameObj.unknownCardPath),
                                      fit: BoxFit.cover)),
                            ));
                }),
          ),
        ),
        SizedBox(
            height: screenWidth * 0.1,
            width: screenWidth * 0.5,
            child: ElevatedButton(
                child: Text(
                  'Reset',
                  style: TextStyle(
                      fontFamily: 'Play', fontSize: 18, color: Colors.black),
                ),
                onPressed: () => setState(() {
                      gameObj.initGame();
                      tries = 0;
                      score = 0;
                    })))
      ],
    );
  }
}
