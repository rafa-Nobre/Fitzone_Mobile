import 'package:fitzone_app/screens/conta_screen/widgets/GraphLevel.dart';
import 'package:flutter/material.dart';

class Level extends StatelessWidget {
  const Level({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Column(
      children: const [
        Row(
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
          children: [
            GraphLevel(
              color: Color.fromARGB(199, 170, 255, 0),
              width: 63 * 5,
            ),
            GraphLevel(
              color: Color.fromARGB(255, 146, 220, 0),
              width: 63 * 4,
            ),
            GraphLevel(
              color: Color.fromARGB(255, 120, 179, 2),
              width: 63 * 3,
            ),
            GraphLevel(
              color: Color.fromARGB(255, 99, 148, 1),
              width: 63 * 2,
            ),
            GraphLevel(
              color: Color.fromARGB(255, 76, 114, 0),
              width: 63,
            )
          ],
        )
      ],
    );
  }
}
