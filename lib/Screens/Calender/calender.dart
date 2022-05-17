import 'package:flutter/material.dart';
import 'package:my_money_app/Screens/navigation/nav.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calender extends StatelessWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Calender"),
            // toolbarHeight: 5.0,
            backgroundColor: Colors.black,
            leading: GestureDetector(
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Nav(),
                  ),
                );
              },
            ),
          ),
          body: SfCalendar(
            view: CalendarView.month,
          )),
    );
  }
}
