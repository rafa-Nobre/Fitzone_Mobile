import 'package:flutter/material.dart';
import 'graph_level.dart';

class LevelWidget extends StatefulWidget {
  const LevelWidget({
    required this.points,
    super.key,
  });

  final int points;

  @override
  State<LevelWidget> createState() => _LevelWidgetState();
}

class _LevelWidgetState extends State<LevelWidget> {
  final _resultLevel = ["FRANGO", "CLASSIC","SHAPEADO","MONSTRO", "BODYBUILDER"];
  int _level = 1;

  int _defineLevel() {
    if (widget.points <=20) {
      return _level = 1;
    } else if (widget.points <= 40) {
      return _level = 2;
    } else if (widget.points <= 60) {
      return _level = 3;
    } else if (widget.points <= 80) {
      return _level = 4;
    } else {
      return _level = 5;
    }
  }

   final List<Color> colors = [
    const Color.fromARGB(255, 76, 114, 0),
    const Color.fromARGB(255, 99, 148, 1),
    const Color.fromARGB(255, 120, 179, 2),
    const Color.fromARGB(255, 146, 220, 0),
    const Color.fromARGB(199, 170, 255, 0),
  ];

  @override
  Widget build(BuildContext context) {
    _defineLevel();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text("Nível ",
                    style: TextStyle(
                      fontSize: 12,
                    )),
                Text(
                  _resultLevel[_level-1],
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.points.toString(),
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const Text(" pontos acumulados",
                    style: TextStyle(
                      fontSize: 12,
                    ))
              ],
            ),
          ],
        ),
        Stack(
          alignment: Alignment.topLeft,
          children: List.generate(_defineLevel(), (index){
            final level = _defineLevel();
            return GraphLevel(
              color: colors[level-index-1],
              width: 63* (level-index).toDouble(),
              );
          }),
        )
      ],
    );
  }
}
