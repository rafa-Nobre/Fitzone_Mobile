import 'package:fitzone_app/common/widgets/NotificationButton.dart';
import 'package:fitzone_app/common/widgets/Photo.dart';
import 'package:fitzone_app/routes/routes_consts.dart';
import 'package:fitzone_app/screens/home_screen/widgets/home_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  

  Widget _screenBuilder(int index) {
    switch (index) {
      case 0:
        return const HomeWidget();
      case 1:
        return const SizedBox();
      case 2:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [NotificationButton(), SizedBox(width: 10), Photo()],
      ),
      body: _screenBuilder(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notificações",
          ),
        ],
      ),
    );
  }
}