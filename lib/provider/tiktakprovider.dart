import 'package:flutter/material.dart';

class TikTakProvider extends ChangeNotifier {
  bool turnOn = true;
  late BuildContext context;
  List<String> displayText = ['', '', '', '', '', '', '', '', ''];
  var player1 = 0, player2 = 0,fillId=0;

  void tapped(int index, BuildContext context) {
    if (turnOn && displayText[index] == '') {
      displayText[index] = "0";
      fillId+=1;
      notifyListeners();
    } else if (!turnOn && displayText[index] == '') {
      displayText[index] = "X";
      fillId+=1;
      notifyListeners();
    }
    turnOn = !turnOn;
    checkWinner(context);
    notifyListeners();
  }

  checkWinner(BuildContext context) {
    ///1st
    if (displayText[0] == displayText[1] &&
        displayText[0] == displayText[2] &&
        displayText[0] != '') {
      checkDialogue(context, displayText[0]);
    } else if (displayText[0] == displayText[3] &&
        displayText[0] == displayText[6] &&
        displayText[0] != '') {
      checkDialogue(context, displayText[0]);
    } else if (displayText[0] == displayText[4] &&
        displayText[0] == displayText[8] &&
        displayText[0] != '') {
      checkDialogue(context, displayText[0]);
    } else if (displayText[1] == displayText[4] &&
        displayText[1] == displayText[7] &&
        displayText[1] != '') {
      checkDialogue(context, displayText[1]);
    } else if (displayText[2] == displayText[4] &&
        displayText[2] == displayText[6] &&
        displayText[2] != '') {
      checkDialogue(context, displayText[2]);
    } else if (displayText[2] == displayText[5] &&
        displayText[2] == displayText[8] &&
        displayText[2] != '') {
      checkDialogue(context, displayText[2]);
    } else if (displayText[3] == displayText[4] &&
        displayText[3] == displayText[5] &&
        displayText[3] != '') {
      checkDialogue(context, displayText[3]);
    } else if (displayText[3] == displayText[4] &&
        displayText[3] == displayText[5] &&
        displayText[3] != '') {
      checkDialogue(context, displayText[3]);
    }
    else if (displayText[6] == displayText[7] &&
        displayText[6] == displayText[8] &&
        displayText[6] != '') {
      checkDialogue(context, displayText[6]);
    }
    else if (fillId==9) {
      drawMatch(context);
    }
  }

  void drawMatch(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Draw"),
        actions: [
          FlatButton(
              onPressed: () {
                clearboard();
                Navigator.of(context).pop();
              },
              child: Text("Play Again!")),
        ],
      ),
    );
  }

  void checkDialogue(BuildContext context, String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Winner is :$winner"),
        actions: [
          FlatButton(
              onPressed: () {
                clearboard();
                Navigator.of(context).pop();
              },
              child: Text("Play Again!")),
        ],
      ),
    );
    if (winner == '0') {
      player1 += 1;
    } else if (winner == 'X') {
      player2 += 1;
    }
  }

  void clearboard() {
    for (int i = 0; i < 9; i++) {
      displayText[i] = '';
    }
    fillId=0;
    notifyListeners();
  }
}
