import 'package:fitzone_app/screens/conta_screen/widgets/GraphLevel.dart';
import 'package:flutter/material.dart';

class Level extends StatelessWidget {
   Level({
    required this.level,
    super.key,
  });

  final int level;

   final List<Color> colors = [
     const Color.fromARGB(255, 76, 114, 0),
    const Color.fromARGB(255, 99, 148, 1),
    const Color.fromARGB(255, 120, 179, 2),
    const Color.fromARGB(255, 146, 220, 0),
    const Color.fromARGB(199, 170, 255, 0),
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Nível ",
                    style: TextStyle(
                      fontSize: 12,
                    )),
                Text(
                  "CLASSIC",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "100",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
                Text(" pontos acumulados",
                    style: TextStyle(
                      fontSize: 12,
                    ))
              ],
            ),
          ],
        ),
        Stack(
          alignment: Alignment.topLeft,
          children: List.generate(level, (index){
            return GraphLevel(
              color: colors[index],
              index: index,
              width: 63* (index+1),
              );
          }),
        )
      ],
    );
  }
}
