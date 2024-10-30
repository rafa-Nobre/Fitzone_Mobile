import 'package:fitzone_app/common/constants/metrics.dart';
import 'package:fitzone_app/common/widgets/search_input.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: defaultSpacing),
      color: Theme.of(context).colorScheme.tertiary,
      child: Padding(
        padding: const EdgeInsets.only(top: defaultSpacing),
        child: Column(
          children: [
            SearchInput(searchController: _searchController),
            const SizedBox(height: defaultSpacing),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: const <Widget>[
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
          ],
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
