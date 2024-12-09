import 'package:fitzone_app/common/widgets/notification_button.dart';
import 'package:fitzone_app/common/widgets/profile_widget.dart';
import 'package:fitzone_app/screens/workout_screen/workout_screen.dart';
import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  State<WorkoutPage> createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {
  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: _color.onSecondary, // Define a cor da seta de voltar
        ),
        backgroundColor: _color.tertiary,
        elevation: 0,
           title: Text(
          'Treino de hoje', // Defina o título aqui
          style: TextStyle(
              color: _color.onSecondary), // Define a cor do texto do título
        ),
        actions: const [
          NotificationButton(),
          SizedBox(width: 10),
          ProfileWidget(),
          SizedBox(width: 10)
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: _color.tertiary,
        ),
        child: WorkoutScreen(),
      ),
    );
  }

}
