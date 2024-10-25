import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      style: TextStyle(
        height: 1,
        fontSize: 12,
        color: Theme.of(context).colorScheme.onSecondary,
      ),
      decoration: InputDecoration(
        hintText: 'Tá procurando suar ou só relaxar?',
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 24,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(38),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
