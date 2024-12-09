import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/screens/account_drawer/account_drawer.dart';
import 'package:fitzone_app/screens/calendar_screen/widgets/event_card.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../common/widgets/notification_button.dart';
import '../../common/widgets/profile_widget.dart';

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
      } else {
        isListVisible = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atividades", style: TextStyle(color: Colors.black),),
        surfaceTintColor: _color.primary,
        backgroundColor: _color.primary,
        // actions: const [
        //   NotificationButton(),
        //   SizedBox(width: 10),
        //   ProfileWidget(),
        //   SizedBox(width: 10)
        // ],
      ),
      body: Stack(
        children: [
          Container(
            color: _color.tertiary,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: _color.primary,
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
                        shape: BoxShape.circle, color: _color.surface),
                    todayTextStyle: const TextStyle(color: Colors.black),
                    defaultTextStyle: const TextStyle(color: Colors.white),
                    defaultDecoration: BoxDecoration(
                        shape: BoxShape.circle, color: _color.inversePrimary),
                  ),
                  focusedDay: todayDate,
                  selectedDayPredicate: (day) => isSameDay(day, todayDate),
                  firstDay: DateTime(todayDate.year, todayDate.month, 1),
                  lastDay:DateTime(todayDate.year, todayDate.month + 1, 0),
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

            Visibility(
                visible: isListVisible,
                child: Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(defaultSpacing),
                    child: SingleChildScrollView(
                      child: Column(
                        children: const [
                          EventCard(
                            content: "Treino com Prof. Ramon Dino",
                            hour: "7:00",
                            isMarked: true,
                          ),
                          EventCard(
                            content: "Aula de dança com Prof. Tainá",
                            hour: "14:30",
                            isMarked: false,
                          ),
                          EventCard(
                            content: "Yoga com Prof. Gracyanne",
                            hour: "19:00",
                            isMarked: true,
                          ),
                          // Adicione mais EventCards aqui se necessário
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !isListVisible,
                child: Padding(
                  padding: const EdgeInsets.all(defaultSpacing),
                  child: const Text("Nenhuma atividade disponível!"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
