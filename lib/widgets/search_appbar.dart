import 'package:flutter/material.dart';

class SearchAppBar extends PreferredSize {
  final TextEditingController controller;
  final VoidCallback onBackPress;
  final void Function(String) onSearchText;
  final void Function(String) onSearch;
  final VoidCallback onClearTap;
  final VoidCallback onFilterTap;
  SearchAppBar(
      {Key key,
      this.controller,
      this.onBackPress,
      this.onSearchText,
      this.onSearch,
      this.onClearTap,
      this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: this.onBackPress,
      ),
      title: TextFormField(
        controller: this.controller,
        autofocus: true,
        onChanged: this.onSearchText,
        onFieldSubmitted: this.onSearch,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Search...',
          isCollapsed: true,
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 20.0),
        ),
      ),
      actions: [
        Tooltip(
          message: 'Clear',
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: this.onClearTap,
          ),
        ),
        Tooltip(
          message: 'Filter',
          child: IconButton(
            icon: Icon(Icons.filter_alt_outlined, color: Colors.black),
            onPressed: this.onFilterTap,
          ),
        )
      ],
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(54);
}
