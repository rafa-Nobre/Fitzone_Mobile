
import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitZone',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(widget.title, 
        style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,        
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<ThemeProvider>(context, listen:false).toggleTheme();
        },
        tooltip: 'Increment',
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        child: const Icon(Icons.add,),
      ),
    );
  }
}
