import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/screens/calendar_screen/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../common/widgets/notification_button.dart';
import '../../common/widgets/photo.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime todayDate = DateTime.now();
  bool isListVisible = true;

  void _onDaySelect(DateTime day, DateTime focusedDay) {
    setState(() {
      todayDate = day;
      if (!isSameDay(day, DateTime.now())) {
        isListVisible = false;
      }else {
        isListVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atividades"),
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
            color: Theme.of(context).colorScheme.surfaceContainer,
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
                  headerStyle: const HeaderStyle(
                      titleCentered: true, formatButtonVisible: false),
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.surface),
                    todayTextStyle: const TextStyle(color: Colors.black),
                    defaultTextStyle: const TextStyle(color: Colors.white),
                    defaultDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  focusedDay: todayDate,
                  selectedDayPredicate: (day) => isSameDay(day, todayDate),
                  firstDay: DateTime.utc(2024, 10, 1),
                  lastDay: DateTime.utc(2024, 11, 29),
                  onDaySelected: _onDaySelect,
                ),
              ),
              const SizedBox(height: defaultSpacing),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: defaultSpacing),
                    child: Text("Atividades de hoje",
                        style: Theme.of(context).textTheme.bodyMedium),
                  )),
              const SizedBox(height: largeSpacing),
              Visibility(
                visible: isListVisible,
                child: Padding(
                  padding: const EdgeInsets.all(defaultSpacing),
                  child: Column(
                    children: [
                      EventCard(
                        content: "Treino com Prof. Ramon Dino",
                        hour: "7:00",
                        isMarked: true,
                      ),
                      const EventCard(
                          content: "Aula de dança com Prof. Tainá",
                          hour: "14:30",
                          isMarked: false),
                      const EventCard(
                          content: "Yoga com Prof. Gracyanne",
                          hour: "19:00",
                          isMarked: true),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: !isListVisible,
                child: const Text("Nenhuma atividade disponível!"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
