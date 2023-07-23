import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class Game3Screen extends StatefulWidget {
  const Game3Screen({super.key});

  @override
  State<Game3Screen> createState() => _Game3ScreenState();
}

class _Game3ScreenState extends State<Game3Screen> {
  bool oTurn = true;
  bool xturn = false;
  List<String> displayXO = ['', '', '', '', '', '', '', '', '', '', '', ''];
  List<int> matchedIndexes = [];
  String resultDeclaration = '';
  int oscore = 0;
  int xscore = 0;
  int score3 = 0;
  int filledBoxes = 0;
  bool winnerFound = false;
  int attempts = 0;

  bool temp = false;

  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;

  static var customFontWhite = GoogleFonts.coiny(
      textStyle: TextStyle(
    color: Colors.white,
    letterSpacing: 3,
    fontSize: 20,
  ));

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          stopTimer();
        }
      });
    });
  }

  void resetTimer() {
    seconds = maxSeconds;
  }

  void stopTimer() {
    resetTimer();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MainColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('PlayerO  ', style: customFontWhite),
                            Text(
                              oscore.toString(),
                              style: customFontWhite,
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 7,
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'PlayerX  ',
                              style: customFontWhite,
                            ),
                            Text(
                              xscore.toString(),
                              style: customFontWhite,
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 7,
                        // ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Player&',
                              style: customFontWhite,
                            ),
                            Text(
                              score3.toString(),
                              style: customFontWhite,
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 5,
                  child: GridView.builder(
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 5,
                                color: MainColor.primaryColor,
                              ),
                              color: matchedIndexes.contains(index)
                                  ? Colors.blueGrey
                                  : MainColor.secondaryColor),
                          child: Center(
                              child: Text(
                            displayXO[index],
                            style: GoogleFonts.coiny(
                                textStyle: TextStyle(
                                    fontSize: 54,
                                    color: MainColor.primaryColor)),
                          )),
                        ),
                      );
                    },
                  )),
              Expanded(
                  flex: 2,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          resultDeclaration,
                          style: customFontWhite,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        _buildTimer()
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }

  void _tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      setState(() {
        if (oTurn && displayXO[index] == '') {
          displayXO[index] = 'O';
          filledBoxes++;
          xturn = true;
          oTurn = false;
        } else if (!oTurn && xturn && displayXO[index] == '') {
          displayXO[index] = 'X';
          filledBoxes++;
          xturn = false;
        } else if (!oTurn && !xturn && displayXO[index] == '') {
          displayXO[index] = '&';
          filledBoxes++;
          oTurn = true;
        }
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[1] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' wins ';
        matchedIndexes.addAll([0, 1, 2]);
        _updateScore(displayXO[0]);
        stopTimer();
      });
    } else if (displayXO[1] == displayXO[2] &&
        displayXO[2] == displayXO[3] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[1] + ' wins ';
        matchedIndexes.addAll([1, 2, 3]);
        _updateScore(displayXO[1]);
        stopTimer();
      });
    } else if (displayXO[4] == displayXO[5] &&
        displayXO[5] == displayXO[6] &&
        displayXO[4] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[4] + ' wins ';
        matchedIndexes.addAll([4, 5, 6]);
        _updateScore(displayXO[4]);
        stopTimer();
      });
    } else if (displayXO[5] == displayXO[6] &&
        displayXO[6] == displayXO[7] &&
        displayXO[5] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[5] + ' wins ';
        matchedIndexes.addAll([5, 6, 7]);
        _updateScore(displayXO[5]);
        stopTimer();
      });
    } else if (displayXO[8] == displayXO[9] &&
        displayXO[9] == displayXO[10] &&
        displayXO[8] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[8] + ' wins ';
        matchedIndexes.addAll([8, 9, 10]);
        _updateScore(displayXO[8]);
        stopTimer();
      });
    } else if (displayXO[9] == displayXO[10] &&
        displayXO[10] == displayXO[11] &&
        displayXO[9] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[9] + ' wins ';
        matchedIndexes.addAll([9, 10, 11]);
        _updateScore(displayXO[9]);
        stopTimer();
      });
    } else if (displayXO[0] == displayXO[4] &&
        displayXO[4] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' wins ';
        matchedIndexes.addAll([0, 4, 8]);
        _updateScore(displayXO[0]);
        stopTimer();
      });
    } else if (displayXO[1] == displayXO[5] &&
        displayXO[5] == displayXO[9] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[1] + ' wins ';
        matchedIndexes.addAll([1, 5, 9]);
        _updateScore(displayXO[1]);
        stopTimer();
      });
    } else if (displayXO[2] == displayXO[6] &&
        displayXO[6] == displayXO[10] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' wins ';
        matchedIndexes.addAll([2, 6, 10]);
        _updateScore(displayXO[2]);
        stopTimer();
      });
    } else if (displayXO[3] == displayXO[7] &&
        displayXO[7] == displayXO[11] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[3] + ' wins ';
        matchedIndexes.addAll([3, 7, 11]);
        _updateScore(displayXO[3]);
        stopTimer();
      });
    } else if (displayXO[0] == displayXO[5] &&
        displayXO[5] == displayXO[10] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + ' wins ';
        matchedIndexes.addAll([0, 5, 10]);
        _updateScore(displayXO[0]);
        stopTimer();
      });
    } else if (displayXO[1] == displayXO[6] &&
        displayXO[6] == displayXO[11] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[1] + ' wins ';
        matchedIndexes.addAll([1, 6, 11]);
        _updateScore(displayXO[1]);
        stopTimer();
      });
    } else if (displayXO[2] == displayXO[5] &&
        displayXO[5] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + ' wins ';
        matchedIndexes.addAll([2, 5, 8]);
        _updateScore(displayXO[2]);
        stopTimer();
      });
    } else if (displayXO[3] == displayXO[6] &&
        displayXO[6] == displayXO[9] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[3] + ' wins ';
        matchedIndexes.addAll([3, 6, 9]);
        _updateScore(displayXO[3]);
        stopTimer();
      });
    }

    if (!winnerFound && filledBoxes == 12) {
      setState(() {
        resultDeclaration = "Nobody Wins !!";
        stopTimer();
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      oscore++;
    } else if (winner == 'X') {
      xscore++;
    } else if (winner == '&') {
      score3++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 12; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
      filledBoxes = 0;
      matchedIndexes = [];
    });
  }

  Widget _buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;
    return isRunning
        ? SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxSeconds,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 4,
                  backgroundColor: MainColor.accentColor,
                ),
                Center(
                  child: Text(
                    '$seconds',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 50.0),
                  ),
                )
              ],
            ),
          )
        : ElevatedButton(
            onPressed: () {
              startTimer();
              _clearBoard();
              attempts++;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: Text(
              attempts == 0 ? 'Start' : 'Play Again',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ));
  }
}
