import 'dart:ffi';

import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/common/widgets/form_widgets/custom_checkbox.dart';
import 'package:fitzone_app/core/models/activity_model.dart';
import 'package:fitzone_app/core/models/workout_model.dart';
import 'package:fitzone_app/data/providers/workout_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbols.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var monthNames = [
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro'
    ];
    var day = now.day;
    var monthName = monthNames[
        now.month - 1]; 
    var _color = Theme.of(context).colorScheme;
    var _text = Theme.of(context).textTheme;

int _getTotalSets(List<ActivityModel> activities) {
  return activities.fold(0, (total, activity) => total + activity.sets.length);
}


    return FutureBuilder(
      future:
          Provider.of<WorkoutProvider>(context, listen: false).fetchWorkouts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Erro ao carregar treinos: ${snapshot.error}"),
          );
        } else {
          final provider = Provider.of<WorkoutProvider>(context);
          final todaysWorkout = provider.todaysWorkout;

          if (todaysWorkout == null) {
            return const Center(
              child: Text("Nenhum treino disponível"),
            );
          } else {
            return Container(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(defaultSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$day de $monthName",
                          style: _text.bodyMedium
                              ?.copyWith(color: _color.onSecondary),
                        ),
                        SizedBox(height: minorSpacing),
                         Row(
                          children: [
                            InfoWorkout(title: "Duração", value: todaysWorkout.estimatedTime.toString() + "min"),
                            InfoWorkout(title: "Exercícios", value: todaysWorkout.activities.length.toString()),
                            InfoWorkout(title: "Séries", value: _getTotalSets(todaysWorkout.activities).toString() ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      height: 1,
                      color: _color.onSecondary.withOpacity(0.2),
                    ),
                    SizedBox(height: minorSpacing),
                    Text(todaysWorkout.name, style: _text.bodyLarge,),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      height: 1,
                      color: _color.onSecondary.withOpacity(0.2),
                    ),
                   Expanded(
                      child: ListView.builder(
                        itemCount: todaysWorkout.activities.length,
                        itemBuilder: (ctx, i) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  decoration: BoxDecoration(
                                    
                                      color: Color.fromRGBO(25, 33, 38, 1).withOpacity(0.8)
                                          ),
                                   
                                  child: Text(
                                    todaysWorkout.activities[i].name,
                                    style: _text.bodyMedium?.copyWith(
                                      color: _color.primaryContainer,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                SizedBox(height: minorSpacing),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("SET",
                                            style: _text.bodySmall?.copyWith(
                                              color: _color.onSecondary,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        Text("PESO",
                                            style: _text.bodySmall?.copyWith(
                                              color: _color.onSecondary,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        Text("REPETIÇÕES",
                                            style: _text.bodySmall?.copyWith(
                                              color: _color.onSecondary,
                                              fontWeight: FontWeight.w400,
                                            )),
                                        Text("V",
                                            style: _text.bodySmall?.copyWith(
                                              color: _color.onSecondary,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: minorSpacing),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: todaysWorkout
                                          .activities[i].sets.length,
                                      itemBuilder: (ctx, j) {
                                        // Adicione um estado local para o checkbox
                                        bool isChecked = false;

                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return Container(
                                             
                                         padding: const EdgeInsets.symmetric(horizontal: 8),
                                              decoration: BoxDecoration(
                                                color: isChecked
                                                    ? _color.primary.withOpacity(0.1)
                                                    : Colors.transparent,
                                        
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    width: 20,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.all(Radius.circular(4)),
                                                      color: _color.surface.withOpacity(0.2)
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(1.0),
                                                      child: Center(
                                                        child: Text(
                                                          todaysWorkout.activities[i]
                                                              .sets[j].type,
                                                          style: _text.bodySmall
                                                              ?.copyWith(
                                                            color: _color.onSecondary,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "${todaysWorkout.activities[i].sets[j].weight}kg",
                                                    style: _text.bodySmall
                                                        ?.copyWith(
                                                      color: _color.onPrimary,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Text(
                                                    todaysWorkout.activities[i]
                                                        .sets[j].reps
                                                        .toString(),
                                                    style: _text.bodySmall
                                                        ?.copyWith(
                                                      color: _color.onPrimary,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Checkbox(
                                                    
                                                    activeColor:
                                                        _color.secondary,
                                                    checkColor:
                                                        _color.onInverseSurface,
                                                    value: isChecked,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        isChecked = value!;
                                                        
                                                        
                                                      });
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )

                  ],
                ),
              ),
            );
          }
        }
      },
    );
  }
}

class InfoWorkout extends StatelessWidget {
  const InfoWorkout({
    super.key,
    required String title,
    required String value,
  })  : _title = title,
        _value = value;

  final String _title;
  final String _value;

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    var _text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(_title,
            style: _text.bodySmall?.copyWith(
                color: _color.onSecondary, fontWeight: FontWeight.normal)),
        const SizedBox(height: minorSpacing),
        Text(_value),
      ]),
    );
  }
}
