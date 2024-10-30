import 'package:fitzone_app/common/widgets/notification_button.dart';
import 'package:fitzone_app/common/widgets/photo.dart';
import 'package:fitzone_app/core/models/user_model.dart';
import 'package:fitzone_app/screens/account_drawer/account_drawer.dart';
import 'package:fitzone_app/screens/home_screen/widgets/home_widget.dart';
import 'package:fitzone_app/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final UserModel _usuario;

  const HomeScreen({required UserModel usuario, super.key}) : _usuario = usuario;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  late final UserModel _usuario;

  @override
  void initState() {
    super.initState();
    _usuario = widget._usuario;
  }

  void changePage(int currentIndex) {
    setState(() {
      _pageIndex = currentIndex;
    });
  }

  Widget _screenBuilder(int index) {
    switch (index) {
      case 0:
        return  HomeWidget(usuario:_usuario);
      case 1:
        return const SearchScreen();
      case 2:
        return const SizedBox();
      case 3:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.tertiary,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        actions: const [NotificationButton(), SizedBox(width: 10), Photo(), SizedBox(width: 10)],
      ),
      drawer: const AccountDrawer(),
      body: _screenBuilder(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (currentIndex) => changePage(currentIndex),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Pesquisar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch),
            label: "Progresso",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
