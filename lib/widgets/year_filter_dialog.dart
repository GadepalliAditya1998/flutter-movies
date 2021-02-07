import 'package:flutter/material.dart';
import 'package:flutterMoviesApp/widgets/year_picker.dart';

class YearFilterDialog extends StatelessWidget {
  final void Function(int) onYearSelected;
  final int selectedYear;
  final VoidCallback onClearYearFilter;
  const YearFilterDialog(
      {Key key, this.onYearSelected, this.selectedYear, this.onClearYearFilter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      height: 300,
      child: Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              color: Theme.of(context).primaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedYear != null
                        ? 'Selected year ($selectedYear)'
                        : 'Select Year',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  if (this.selectedYear != null)
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          if (this.onClearYearFilter != null)
                            this.onClearYearFilter();
                        },
                        child: Text('Clear',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)))
                ],
              ),
            ),
            Container(
              height: 150,
              child: CustomYearPicker(
                  toYear: date.year, onYearSelected: onYearSelected),
            ),
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                alignment: Alignment.centerRight,
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
