import 'package:fitzone_app/common/widgets/notification_button.dart';
import 'package:fitzone_app/common/widgets/profile_widget.dart';
import 'package:fitzone_app/data/providers/event_provider.dart';
import 'package:fitzone_app/screens/account_drawer/account_drawer.dart';
import 'package:fitzone_app/screens/home_screen/widgets/home_widget.dart';
import 'package:fitzone_app/screens/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/providers/user_provider.dart';
import '../profile_screen/profile_screen.dart';
import '../progress_screen/progress_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).setCurrentUser();
    
  }

  void changePage(int currentIndex) {
    setState(() {
      _pageIndex = currentIndex;
    });
  }

  Widget _screenBuilder(int index) {
    switch (index) {
      case 0:
        return ChangeNotifierProvider(create: (context) => EventProvider(), child: const HomeWidget());
      case 1:
        return const SearchScreen();
      case 2:
        return const ProgressScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: color.tertiary,
        backgroundColor: color.tertiary,
        actions: const [
          NotificationButton(),
          SizedBox(width: 10),
          ProfileWidget(),
          SizedBox(width: 10)
        ],
      ),
      drawer: const AccountDrawer(),
      body: _screenBuilder(_pageIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: color.surfaceContainerLow,
              width: 1 
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _pageIndex,
          onTap: (currentIndex) => changePage(currentIndex),
          showUnselectedLabels: true,
          backgroundColor: color.tertiary,
          selectedItemColor: color.secondary,
          unselectedItemColor: color.onPrimary,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: "Home",
              backgroundColor: color.tertiary,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: "Pesquisar",
              backgroundColor: color.tertiary,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.rocket_launch),
              label: "Progresso",
              backgroundColor: color.tertiary,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle_outlined),
              label: "Perfil",
              backgroundColor: color.tertiary,
            ),
          ],
        ),
      ),
    );
  }
}
