import 'package:flutter/material.dart';

import '../modals/logic_Game.dart';

class containerBoard extends StatelessWidget {
  const containerBoard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.withOpacity(.4),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          Player.playerX.contains(index)
              ? "X"
              : Player.playerO.contains(index)
                  ? "O"
                  : "",
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.w800,
            color: Player.playerX.contains(index) ? Colors.green : Colors.pink,
          ),
        ),
      ),
    );
  }
}
