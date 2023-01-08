class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
  static List<int> playerX = []; //0 2 4 6
  static List<int> playerO = []; //1 3 5 8 9
}

class Game {
  void playGame(int index, String activePlayer) {
    if (activePlayer == "X") {
      Player.playerX.add(index);
    } else {
      Player.playerO.add(index);
    }
  }

  checkWinner() {}
  Future autoPlay() async {}
}
