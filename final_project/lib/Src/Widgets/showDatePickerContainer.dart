import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class showDatePickerContainer extends StatefulWidget {
  const showDatePickerContainer({super.key});

  @override
  State<showDatePickerContainer> createState() =>
      _showDatePickerContainerState();
}

class _showDatePickerContainerState extends State<showDatePickerContainer> {
  @override
  void initState() {
    Provider.of<dataprovider>(context, listen: false).datePickerProject = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateRangePickerController pickerDate = DateRangePickerController();
    return GestureDetector(
      onTap: () async {
        await showDialog(
          builder: (context) => Center(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white),
              height: heightScr(context) * 0.5,
              width: widthScr(context) * 0.8,
              child: SfDateRangePicker(
                initialSelectedDate: pickerDate.selectedDate,
                controller: pickerDate,
                onSelectionChanged: (_) {
                  if (pickerDate.selectedDate != null) {
                    Provider.of<dataprovider>(context, listen: false)
                        .changeDatePickerProject(pickerDate);
                  }
                  Navigator.pop(context);
                  print(pickerDate.selectedDate);
                },
                minDate: DateTime.now(),
                selectionMode: DateRangePickerSelectionMode.single,
              ),
            ),
          ),
          context: context,
        );
      },
      child: Container(
        width: widthScr(context) * 0.85,
        height: heightScr(context) * 0.06,
        decoration: BoxDecoration(
          color: greyColor(),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.date_range,
                color: Colors.grey[600],
              ),
              Provider.of<dataprovider>(
                        context,
                      ).datePickerProject !=
                      null
                  ? Text(
                      Provider.of<dataprovider>(
                        context,
                      ).datePickerProject!.selectedDate.toString(),
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  : Text(
                      Provider.of<languages>(context).tSelectDate(),
                      style: TextStyle(color: Colors.grey[700]),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
