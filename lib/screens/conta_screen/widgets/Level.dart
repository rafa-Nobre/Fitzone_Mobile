import 'package:fitzone_app/screens/conta_screen/widgets/GraphLevel.dart';
import 'package:flutter/material.dart';

class Level extends StatelessWidget {
   Level({
    required this.points,
    super.key,
  });

 final _resultLevel = ["FRANGO", "CLASSIC","SHAPEADO","MONSTRO", "BODYBUILDER"];
  int _level = 1;

  final int points;

  int _defineLevel() {
    if (points <=20) {
      return this._level = 1;
    } else if (points <= 40) {
      return this._level = 2;
    } else if (points <= 60) {
      return this._level = 3;
    } else if (points <= 80) {
      return this._level = 4;
    } else {
      return this._level = 5;
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
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  points.toString(),
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
