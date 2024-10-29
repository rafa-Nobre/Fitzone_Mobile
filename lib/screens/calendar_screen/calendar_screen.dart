import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/common/theme/colors.dart';
import 'package:fitzone_app/screens/calendar_screen/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../common/widgets/NotificationButton.dart';
import '../../common/widgets/Photo.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: const [
          NotificationButton(),
          SizedBox(width: 10),
          Photo(),
          SizedBox(width: 10)
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)),
                ),
                height: 380,
                child: TableCalendar(
                  calendarStyle: CalendarStyle(
                    //todayDecoration: BoxDecoration(shape:BoxShape.circle ,color: Theme.of(context).colorScheme.),
                    defaultTextStyle: const TextStyle(color: Colors.white),
                    defaultDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  focusedDay: DateTime.now(),
                  currentDay: DateTime.now(),
                  firstDay: DateTime.utc(2024, 10, 1),
                  lastDay: DateTime.utc(2024, 10, 29),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(defaultSpacing),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        const SizedBox(height: minorSpacing),
                        Text("Atividades de hoje", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white)),
                        const SizedBox(height: defaultSpacing),
                        EventCard(content: "Treino com Prof. Ramon Dino", hour: "7:00", isMarked: true, onMarkTask: (v){}),
                        EventCard(content: "Aula de dança com Prof. Tainá", hour: "14:30", isMarked: false, onMarkTask: (v){}),
                        EventCard(content: "Yoga com Prof. Gracyanne", hour: "19:00", isMarked: true, onMarkTask: (v){}),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
