import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    return TextField(
      controller: _searchController,
      style: TextStyle(
        height: 1,
        fontSize: 12,
        color: _color.onSecondary,
      ),
      decoration: InputDecoration(
        hintText: 'Tá procurando suar ou só relaxar?',
        hintStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: _color.onSecondary,
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 24,
          color: _color.onSecondary,
        ),
        filled: true,
        fillColor: _color.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(38),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
