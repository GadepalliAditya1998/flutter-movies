import 'package:flutter/material.dart';

class LazyLoadGridView<T> extends StatelessWidget {
  final VoidCallback onScrollEnd;
  final int itemsPerRow;
  final List<T> data;
  final Widget Function(BuildContext, int) itemBuilder;
  final isDataFetching;
  final ScrollController controller;

  LazyLoadGridView({
    Key key,
    @required this.itemsPerRow,
    @required this.data,
    @required this.itemBuilder,
    @required this.controller,
    this.onScrollEnd,
    this.isDataFetching,
  })  : assert(data != null, 'data cannot be null'),
        assert(itemBuilder != null, 'Builder cannot be null');

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _onScroll,
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              controller: this.controller,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: this.data.length,
              itemBuilder: this.itemBuilder,
            ),
          ),
          this.isDataFetching ? _loadingthis : SizedBox.shrink(),
        ],
      ),
    );
  }

  bool _onScroll(Notification notification) {
    bool isScreenEnd = this.controller.position.maxScrollExtent ==
        this.controller.position.pixels;
    if (notification is ScrollEndNotification &&
        isScreenEnd &&
        this.onScrollEnd != null) {
      this.onScrollEnd();
    }
    return true;
  }

  Widget get _loadingthis => Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 20,
      width: 20,
      child: CircularProgressIndicator());

  // @override
  // _LazyLoadGridViewState createState() => _LazyLoadGridViewState();
}

// class _LazyLoadGridViewState extends State<LazyLoadGridView> {
//   @override
//   void initState() {
//     super.initState();
//     this.this.controller = ScrollController();
//   }
// }
