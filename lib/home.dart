import 'package:flutter/material.dart';
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
    bool landScape = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        child: landScape
            ? Column(
                children: [
                  //title
                  ...firstBlock(context, wat, rea),
                  SizedBox(
                    height: landScape == true ? 5 : 20,
                  ),
                  //board
                  _expanded(
                    landScape: landScape,
                    rea: rea,
                    wat: wat,
                  ),
                  //active player now
                  ...lastBlock(context, wat, rea),
                  SizedBox(
                    height: landScape == true
                        ? MediaQuery.of(context).size.height * .05
                        : MediaQuery.of(context).size.height * .1,
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...firstBlock(context, wat, rea),
                        ...lastBlock(context, wat, rea),
                      ],
                    ),
                  ),
                  _expanded(landScape: landScape, wat: wat, rea: rea),
                ],
              ),
      ),
    );
  }

  List<Widget> firstBlock(context, wat, rea) {
    return [
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
    ];
  }

  List<Widget> lastBlock(context, wat, rea) {
    return [
      Text(
        'It\'s ${wat.activePlayer} player',
        style: Theme.of(context).textTheme.headline3,
      ),
      //result
      Text(
        wat.result,
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
          backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
        ),
      ),
    ];
  }
}

class _expanded extends StatelessWidget {
  const _expanded({
    Key? key,
    required this.landScape,
    required this.wat,
    required this.rea,
  }) : super(key: key);

  final bool landScape;
  final contr wat;
  final contr rea;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: List.generate(
          9,
          (index) => InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: wat.gameOver ? null : () => rea.onTapIndex(index),
            child: containerBoard(
              index: index,
            ),
          ),
        ),
      ),
    );
  }
}
