import 'dart:math';

class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
  static List<int> playerX = []; //0 2 4 6
  static List<int> playerO = []; //1 3 5 8 9
}

extension ContainsAll on List {
  bool containsAll(int x, int y, [z]) {
    if (z == null) {
      return contains(x) && contains(y);
    } else {
      return contains(x) && contains(y) && contains(z);
    }
  }
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == "X") {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  String checkWinner() {
    String winner = "";
    bool gameOver = false;
    if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerX.containsAll(3, 4, 5) ||
        Player.playerX.containsAll(6, 7, 8) ||
        Player.playerX.containsAll(0, 3, 6) ||
        Player.playerX.containsAll(1, 4, 7) ||
        Player.playerX.containsAll(2, 5, 8) ||
        Player.playerX.containsAll(0, 4, 8) ||
        Player.playerX.containsAll(2, 4, 6)) {
      winner = "X";
    } else if (Player.playerX.containsAll(0, 1, 2) ||
        Player.playerO.containsAll(3, 4, 5) ||
        Player.playerO.containsAll(6, 7, 8) ||
        Player.playerO.containsAll(0, 3, 6) ||
        Player.playerO.containsAll(1, 4, 7) ||
        Player.playerO.containsAll(2, 5, 8) ||
        Player.playerO.containsAll(0, 4, 8) ||
        Player.playerO.containsAll(2, 4, 6)) {
      winner = "O";
    } else {
      winner = "";
    }
    return winner;
  }

  Future autoPlay(String activePlayer) async {
    int index = 0;
    List<int> emptyL = [];
    for (int i = 0; i < 9; i++) {
      if (!(Player.playerO.contains(i) || Player.playerX.contains(i))) {
        emptyL.add(i);
      }
    }
    Random randomInd = Random();
    int rInd = randomInd.nextInt(emptyL.length);
    index = emptyL[rInd];
    playGame(index, activePlayer);
  }
}
