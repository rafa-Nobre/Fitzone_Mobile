import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/common/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.all(defaultSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Olá,", style: Theme.of(context).textTheme.bodyMedium),
                TextSpan(
                    text: " Fulano\u00A0",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        backgroundColor: Theme.of(context).colorScheme.primary))
              ])),
              Text("Preparado para o\ndesafio de hoje?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 25)),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerLow,
                        borderRadius:
                            BorderRadius.circular(28), // Define o arredondamento
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(
                                      28), // Define o arredondamento
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.calendar_month_outlined,
                                      size: 13),
                                )),
                            Text("  Calendário",
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
                      borderRadius:
                          BorderRadius.circular(28), // Define o arredondamento
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                borderRadius: BorderRadius.circular(
                                    28), // Define o arredondamento
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.directions_bike, size: 13),
                              )),
                          Text("  Atividades",
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerLow,
                        borderRadius:
                            BorderRadius.circular(28), // Define o arredondamento
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(
                                      28), // Define o arredondamento
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.fitness_center, size: 13),
                                )),
                            Text("  Treinos",
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28)),
                child: Stack(
                  children: [
                    Image.asset('assets/images/image.png'),
                    Image.asset('assets/images/overlay.png'),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Veja seu treino\nde hoje",
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                          SizedBox(height: 35,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text("Ver mais", style: TextStyle(color: Color.fromRGBO(162, 199, 46, 1)),),
                                  SizedBox(width: 10,),
                                  Icon(Icons.arrow_forward_ios_outlined, color: Color.fromRGBO(162, 199, 46, 1), size: 10,)
                                ],
                              ),
                              SizedBox(width: 150,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                  ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.timer_outlined, size: 13),
                                      Text(" 50 min")
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text("METAS DE HOJE"),
              Column(children: [
                Row(children: [
                  Container(
                    height: 163,
                    width: 163,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(10)),
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Row(children: [
                            Text("1/7", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 23)),
                            SizedBox(width: 75,),
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(Icons.arrow_outward_outlined),
                              )
                            )
                          ],),
                          SizedBox(height: 60,),
                          Text("Treinos diários", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          SizedBox(height: 6,),
                          Text("você está indo bem!")
                        ],),
                      )
                    ],),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    height: 163,
                    width: 163,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerLow, borderRadius: BorderRadius.circular(10)),
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          SizedBox(height: 10,),
                          Icon(Icons.local_fire_department_outlined, size: 55, color: Theme.of(context).colorScheme.primary,),
                          SizedBox(height: 30,),
                          Text("Aula de dança", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          SizedBox(height: 2,),
                          Text("08:00", style: TextStyle(fontSize: 20))
                        ],),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.arrow_outward_outlined),
                          )
                        ),
                      )
                    ],),
                  )
                ],),
                SizedBox(height: 20,),
                Row(children: [
                  Container(
                    height: 163,
                    width: 163,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerLow, borderRadius: BorderRadius.circular(10)),
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          SizedBox(height: 10,),
                          Icon(Icons.directions_run_outlined, size: 55, color: Theme.of(context).colorScheme.primary,),
                          SizedBox(height: 30,),
                          Text("Aula de dança", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                          SizedBox(height: 2,),
                          Text("08:00", style: TextStyle(fontSize: 20))
                        ],),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Icon(Icons.arrow_outward_outlined),
                          )
                        ),
                      )
                    ],),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    height: 163,
                    width: 163,
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerLow, borderRadius: BorderRadius.circular(10)),
                    child: Stack(children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        
                          children: [
                          Text("+"),
                          Text("adicionar\natividade")
                        ],),
                      ),
                    ],),
                  )
                ],)
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
