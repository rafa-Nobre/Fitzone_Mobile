import 'package:fitzone_app/common/widgets/notification_button.dart';
import 'package:fitzone_app/common/widgets/profile_widget.dart';
import 'package:fitzone_app/core/models/user_model.dart';
import 'package:fitzone_app/screens/account_drawer/account_drawer.dart';
import 'package:fitzone_app/screens/home_screen/widgets/home_widget.dart';
import 'package:fitzone_app/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final UserModel _usuario;

  const HomeScreen({required UserModel usuario, super.key})
      : _usuario = usuario;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  late UserModel currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = widget._usuario;
  }

  void changePage(int currentIndex) {
    setState(() {
      _pageIndex = currentIndex;
    });
  }

  Widget _screenBuilder(int index) {
    switch (index) {
      case 0:
        return HomeWidget(currentUser: currentUser);
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
    var _color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: _color.tertiary,
        backgroundColor: _color.tertiary,
        actions: const [
          NotificationButton(),
          SizedBox(width: 10),
          ProfileWidget(),
          SizedBox(width: 10)
        ],
      ),
      drawer: AccountDrawer(profileUser: currentUser),
      body: _screenBuilder(_pageIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: _color.surfaceContainerLow,
              width: 1 
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (currentIndex) => changePage(currentIndex),
          showUnselectedLabels: true,
          backgroundColor: _color.tertiary,
          selectedItemColor: _color.secondary,
          unselectedItemColor: _color.onPrimary,
        
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: _color.tertiary,
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
      ),
    );
  }
}
