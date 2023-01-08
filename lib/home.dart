import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:tictac/controls/controllerr.dart';
import 'package:tictac/views/containerBoard.dart';

import 'modals/logic_Game.dart';

class MyHomePage extends StatelessWidget {
  Game g = Game();
  @override
  Widget build(BuildContext context) {
    final wat = context.watch<contr>();
    final rea = context.read<contr>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //title
            Text('TIC TAC TOE', style: Theme.of(context).textTheme.headline2),
            //sitched on /off two player
            SwitchListTile(
              title: Text(
                'Turn on/off two player',
                style: Theme.of(context).textTheme.headline5,
              ),
              value: wat.isSwitched,
              onChanged: (v) => rea.changeSwitched(v),
            ),
            const SizedBox(
              height: 20,
            ),
            //board
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: List.generate(
                  9,
                  (index) => InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: wat.gameOver
                        ? null
                        : () {
                            rea.onTapIndex(index);
                            if (g.checkWinner() != "") {
                              showToast(
                                wat.result,
                                context: context,
                                animation: StyledToastAnimation.scale,
                                reverseAnimation: StyledToastAnimation.fade,
                                position: StyledToastPosition.center,
                                animDuration: Duration(milliseconds: 500),
                                duration: Duration(seconds: 4),
                              );
                            }
                          },
                    child: containerBoard(
                      index: index,
                    ),
                  ),
                ),
              ),
            ),
            //active player now
            Text(
              'It\'s ${wat.activePlayer} player',
              style: Theme.of(context).textTheme.headline3,
            ),
            //result
            Text(
              g.checkWinner() != "" ? wat.result : "",
              style: Theme.of(context).textTheme.headline4,
            ),
            //repeat the game
            ElevatedButton.icon(
              onPressed: () => rea.repeatTheGame(),
              icon: const Icon(Icons.repeat),
              label: const Text(
                'Repeat the game',
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlueAccent),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
