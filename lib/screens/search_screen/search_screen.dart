import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/common/theme/theme_provider.dart';
import 'package:fitzone_app/common/widgets/NotificationButton.dart';
import 'package:fitzone_app/common/widgets/Photo.dart';
import 'package:fitzone_app/common/widgets/SearchInput.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.background,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: const [NotificationButton(), SizedBox(width: 10), Photo()],
      ),
      body: Expanded(
        child: Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.background,
          child: Padding(
            padding: const EdgeInsets.only(top: defaultSpacing),
            child: Column(children: [
              SearchInput(searchController: _searchController),
              SizedBox(height: defaultSpacing),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    SearchItem(),
                    SearchItem(),
                    SearchItem(),
                    SearchItem(),
                    SearchItem(),
                    SearchItem(),
                    SearchItem(),
                  ],
                ),
              )
            ]),
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

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Theme.of(context).colorScheme.surfaceContainerLow),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
    );
  }
}
