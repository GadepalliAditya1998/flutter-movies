import 'package:flutter/material.dart';

class SearchAppBar extends PreferredSize {
  final VoidCallback onBackPress;
  final void Function(String) onSearchText;
  final void Function(String) onSearch;
  final VoidCallback onClearTap;
  SearchAppBar(
      {Key key,
      this.onBackPress,
      this.onSearchText,
      this.onSearch,
      this.onClearTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: this.onBackPress,
      ),
      title: TextFormField(
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
        IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: this.onClearTap,
        )
      ],
    );
  }

  @override
  final Size preferredSize = Size.fromHeight(54);
}
