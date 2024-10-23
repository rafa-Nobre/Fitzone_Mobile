import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/screens/conta_screen/widgets/ButtonMenu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContaScreen extends StatelessWidget {
  const ContaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.background,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const botao_voltar_app_bar(),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 24, right: 24),
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Column(
            children: [
              const perfil(),
              const SizedBox(
                height: defaultSpacing,
              ),
              const Status(),
              const SizedBox(
                height: largeSpacing,
              ),
              const nivel(),
              const SizedBox(
                height: extraLargeSpacing,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("FITZONE"),
                  const SizedBox(
                    height: minorSpacing,
                  ),
                  Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerLow),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: const Column(
                        children: [
                          ButtonMenu(title: "Evolução", ),
                          ButtonMenu(title: "Pagamento"),
                          ButtonMenu(title: "Treinos"),
                          ButtonMenu(title:"Professor"),
                          ButtonMenu(title: "Configurações"),
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        },
        tooltip: 'Increment',
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class nivel extends StatelessWidget {
  const nivel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            // Container(
            //   height: 20,
            //   width: double.infinity,
            //   decoration:
            //   BoxDecoration(
            //     color: Theme.of(context).colorScheme.primary,
            //     shape: BoxShape.rectangle,

            //   ),

            // ),
          ],
        )
      ],
    );
  }
}

class Status extends StatelessWidget {
  const Status({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Status",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Text(
              "MATRÍCULA ATIVA",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const Text(
          "VENCIMENTO EM 5 DIAS",
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class perfil extends StatelessWidget {
  const perfil({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.red),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Fulano Beltrano',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'fulanobeltrano@email.com',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                "Gerenciar configurações de conta",
                style: Theme.of(context).textTheme.displayLarge,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class botao_voltar_app_bar extends StatelessWidget {
  const botao_voltar_app_bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.onSecondary,
          onPressed: () {},
        ),
        Text(
          'Conta',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}
