import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/core/models/user_model.dart';
import 'package:fitzone_app/routes/routes_consts.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
   final UserModel _usuario;

  const HomeWidget({required UserModel currentUser, super.key}) : _usuario = currentUser;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {

  late final UserModel _usuario;

@override
void initState() {
  super.initState();
  _usuario = widget._usuario;
}
  
  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        color: _color.tertiary,
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
                    text: _usuario.nickName,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        backgroundColor: _color.primary, color: Colors.black))
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
                            color: _color.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: _color.primary,
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
                            color: _color.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: _color.primary,
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
                            color: _color.surfaceContainerLow,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: _color.primary,
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
              Container(
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
                                const SizedBox(
                                  width: 150,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.timer_outlined, size: 13),
                                      Text(" 50 min")
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
                            color: _color.primary,
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
                              color: _color.tertiary,
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
                                        child: Text("Sexta feira, 16 de Novembro", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: _color.onPrimary),),
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
                                        decoration: BoxDecoration(color: _color.primary, borderRadius: BorderRadius.circular(6)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(color: _color.surfaceContainer, borderRadius: BorderRadius.circular(7)),
                                                    child: const Padding(
                                                      padding: EdgeInsets.all(6.0),
                                                      child: Icon(Icons.timer_outlined, size: 22,),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10,),
                                                   Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text("Duração", style: TextStyle(color: _color.onPrimary),),
                                                      Text("45 min",
                                                          style: TextStyle(
                                                              color: _color
                                                                  .onPrimary))
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
                                                    decoration: BoxDecoration(color: _color.surfaceContainer, borderRadius: BorderRadius.circular(7)),
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
                                                              color: _color
                                                                  .onPrimary)),
                                                      Text("08:00",
                                                          style: TextStyle(
                                                              color: _color
                                                                  .onPrimary))
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
                                                    decoration: BoxDecoration(color: _color.surfaceContainer, borderRadius: BorderRadius.circular(7)),
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
                                                              color: _color
                                                                  .onPrimary)),
                                                      Text("Iniciante",
                                                          style: TextStyle(
                                                              color: _color
                                                                  .onPrimary))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 25,),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: _color.surfaceContainer, borderRadius: BorderRadius.circular(5)),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(color: _color.surfaceContainer, borderRadius: BorderRadius.circular(20)),
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
                                              TextSpan(text: "abertas", style: TextStyle(color: _color.secondary))
                                            ] 
                                            )
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15,),
                                      Text("Em caso de desistência, por favor desconfirme a presença para liberar a vaga.", style: Theme.of(context).textTheme.bodySmall!.copyWith(color: _color.onPrimary),),
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
                        child: Container(
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
                                          _color.primary,
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      "Aula de dança",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Text("08:00",
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
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
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
                                        _color.primary,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    "Aula de dança",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text("08:00",
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
