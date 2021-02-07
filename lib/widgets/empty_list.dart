import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoData extends StatelessWidget {
  final String message;
  const NoData({Key key, this.message = 'No Data'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/empty.svg',
          height: 150,
          width: 150,
        ),
        SizedBox(height: 15),
        Text(message)
      ],
    );
  }
}
