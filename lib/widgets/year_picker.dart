import 'package:flutter/material.dart';

class CustomYearPicker extends StatelessWidget {
  final int fromYear;
  final int toYear;
  final void Function(int) onYearSelected;

  const CustomYearPicker(
      {Key key, this.fromYear = 1900, this.toYear, this.onYearSelected})
      : assert(fromYear < toYear, 'To Year should be greater than from year'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var list =
        List.generate(toYear - fromYear, (index) => this.fromYear + index);

    return Material(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                    if (this.onYearSelected != null)
                      onYearSelected(list[index]);
                  },
                  title: Text('${list[index]}'),
                )));
  }
}
