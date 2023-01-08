import 'package:flutter/material.dart';

import '../modals/logic_Game.dart';

class contr with ChangeNotifier {
  String activePlayer = "X"; // to know who player playes now
  bool gameOver = false; //to know game is over or not
  int turn = 0; //number of times (0:9)
  String result = '';
  bool isSwitched = false;
  Game g = Game();
  //change switched on/off
  changeSwitched(v) {
    isSwitched = v;
    notifyListeners();
  }

//function  to repeat the game
  repeatTheGame() {
    Player.playerO = [];
    Player.playerX = [];
    activePlayer = "X";
    gameOver = false;
    turn = 0;
    result = 'xxxxxxxx';
    isSwitched = false;
    notifyListeners();
  }

  //logic board index
  onTapIndex(ind) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(ind)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(ind))) {
      g.playGame(ind, activePlayer);
      updateActive();
      if (isSwitched && !gameOver) {
        await g.autoPlay(activePlayer);
        updateActive();
      }
    }

    notifyListeners();
  }

  //update Active
  updateActive() {
    activePlayer = activePlayer == "X" ? "O" : "X";
    turn++;
    if (g.checkWinner() != "") {
      gameOver = true;
      result = "It's ${g.checkWinner()} is winner";
    } else if (turn == 9) {
      result = "It's drew";
    }
    notifyListeners();
  }
}
