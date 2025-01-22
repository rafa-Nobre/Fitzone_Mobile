import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/data/providers/event_provider.dart';
import 'package:fitzone_app/data/providers/user_provider.dart';
import 'package:fitzone_app/routes/routes_consts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'qr_scanner_container.dart';

class HomeWidget extends StatefulWidget {

  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  
  @override
  void initState() {
    super.initState();
    Provider.of<EventProvider>(context, listen: false).fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: color.tertiary,
        child: Padding(
          padding: const EdgeInsets.all(defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Olá, ",
                    style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: Provider.of<UserProvider>(context).currentUser?.name ?? "[...]",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        backgroundColor: color.primary, color: Colors.black))
              ])),
              Text("Preparado para o\ndesafio de hoje?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 25)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 120),
                        child: Container(
                          decoration: BoxDecoration(
                            color: color.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: color.primary,
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.calendar_month_outlined, size: 13, color: Colors.black,),
                                  ),
                                ),
                                Text("  Calendário",
                                    style: Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 120),
                        child: Container(
                          decoration: BoxDecoration(
                            color: color.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: color.primary,
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.directions_bike, size: 13, color: Colors.black),
                                  ),
                                ),
                                Text("  Atividades",
                                    style: Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 120),
                        child: Container(
                          decoration: BoxDecoration(
                            color: color.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: color.primary,
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(Icons.fitness_center, size: 13, color: Colors.black),
                                  ),
                                ),
                                Text("  Treinos",
                                    style: Theme.of(context).textTheme.bodySmall),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(RoutesConsts.todaysWorkout),
                child: Container(
                  height: 200,
                  width: 350,
                 
                  child: Stack(
                    children: [
                      Image.asset('assets/images/image.png'),
                      Image.asset('assets/images/overlay.png'),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                       
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Veja seu treino\nde hoje",
                                style: TextStyle(color: Colors.white, fontSize: 28),
                              ),
                              const SizedBox(
                                height: 35,
                              ),
                              Row(
                               
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        "Ver mais",
                                        style: TextStyle(
                                            color: Color.fromRGBO(162, 199, 46, 1)),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Color.fromRGBO(162, 199, 46, 1),
                                        size: 10,
                                      )
                                    ],
                                  ),
                               
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: const Row(
                                      children: [
                                        Icon(Icons.timer_outlined, size: 13, color: Colors.black,),
                                        Text(" 50 min", style: TextStyle(color: Colors.black),)
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: defaultSpacing,
              ),
              const Text("METAS DE HOJE"),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 163,
                        width: 163,
                        decoration: BoxDecoration(
                            color: color.primary,
                            borderRadius: BorderRadius.circular(10)),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("1/7",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(fontSize: 23, color: Colors.black)),
                                      const SizedBox(
                                        width: 75,
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Icon(
                                                Icons.arrow_outward_outlined, color: Colors.black),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 60,
                                  ),
                                  const Text(
                                    "Treinos diários",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  const Text("você está indo bem!", style: TextStyle(color: Colors.black),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) => BottomSheet(
                            onClosing: () => Navigator.of(context).pop(),
                            builder: (context) => Container(
                              color: color.tertiary,
                              child: Padding(
                                padding: const EdgeInsets.all(defaultSpacing),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text("Sexta feira, 16 de Novembro", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: color.onPrimary),),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Yoga com Prof. Gracyanne",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                          "Gracyanne Barbosa vai te guiar numa sessão de yoga que vai te deixar flexível e focado(a). Aqui a gente alonga, relaxa e ainda trabalha aquele bumbum na nuca!"),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(color: color.primary, borderRadius: BorderRadius.circular(6)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(color: color.surfaceContainer, borderRadius: BorderRadius.circular(7)),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(6.0),
                                                      child: Icon(Icons.timer_outlined, size: 22,),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                   Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Duração", style: TextStyle(color: color.onInverseSurface),),
                                                      Text("45 min",
                                                          style: TextStyle(
                                                              color: color
                                                                  .onInverseSurface))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(color: color.surfaceContainer, borderRadius: BorderRadius.circular(7)),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(6.0),
                                                      child: Icon(Icons.wb_sunny_outlined, size: 22,),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                   Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Horário",
                                                          style: TextStyle(
                                                              color: color
                                                                  .onInverseSurface)),
                                                      Text("08:00",
                                                          style: TextStyle(
                                                              color: color
                                                                  .onInverseSurface))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(color: color.surfaceContainer, borderRadius: BorderRadius.circular(7)),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(6.0),
                                                      child: Icon(Icons.stars_sharp, size: 22,),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                   Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Nível",
                                                          style: TextStyle(
                                                              color: color
                                                                  .onInverseSurface)),
                                                      Text("Iniciante",
                                                          style: TextStyle(
                                                              color: color
                                                                  .onInverseSurface))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 25,),
                                      const QRScannerContainer(),
                                      Visibility(
                                        visible: false,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: color.surfaceContainer, borderRadius: BorderRadius.circular(5)),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(color: color.surfaceContainer, borderRadius: BorderRadius.circular(20)),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(5.0),
                                                        child: Icon(Icons.check),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10,),
                                                    const Text("Presença confirmada!", style: TextStyle(fontWeight: FontWeight.bold),)
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 15,),
                                              RichText(text: 
                                              TextSpan(children:[
                                                TextSpan(text: "2 vagas ", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
                                                TextSpan(text: "abertas", style: TextStyle(color: color.secondary))
                                              ] 
                                              )
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15,),
                                      Text("Em caso de desistência, por favor desconfirme a presença para liberar a vaga.", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: color.onPrimary),),
                                      const SizedBox(height: 10,),
                                      Container(
                                        decoration: BoxDecoration(color: const Color.fromARGB(255, 240, 141, 134), borderRadius: BorderRadius.circular(5)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(child: Text("Não vou mais comparecer", style: TextStyle(color: Color.fromARGB(255, 163, 12, 1)),)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        child: Consumer<EventProvider>(
                          builder: (context, eventProviderModel, child) {
                            final events = eventProviderModel.events;
                            final lastEvent = events[events.length - 1];
                            return  Container(
                            height: 163,
                            width: 163,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerLow,
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Icon(
                                        Icons.local_fire_department_outlined,
                                        size: 55,
                                        color:
                                            color.primary,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        lastEvent.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(DateFormat('HH:mm').format(lastEvent.date),
                                          style: TextStyle(fontSize: 20))
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(Icons.arrow_outward_outlined),
                                      )),
                                )
                              ],
                            ),
                          );
                          }
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Consumer<EventProvider>(
                        builder: (context, eventProviderModel, child) {
                          final events = eventProviderModel.events;
                          final secondLastEvent = events[events.length - 2];
                          return Container(
                            height: 163,
                            width: 163,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerLow,
                                borderRadius: BorderRadius.circular(10)),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Icon(
                                        Icons.directions_run_outlined,
                                        size: 55,
                                        color:
                                            color.primary,
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Text(
                                        secondLastEvent.name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(DateFormat('HH:mm').format(secondLastEvent.date),
                                          style: TextStyle(fontSize: 20))
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black)),
                                      child: const Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Icon(Icons.arrow_outward_outlined),
                                      )),
                                )
                              ],
                            ),
                          );
                        }
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(RoutesConsts.calendar),
                        child: Container(
                          height: 163,
                          width: 163,
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerLow,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Stack(
                            children: [
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("+"),
                                    Text("adicionar\natividade")
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
