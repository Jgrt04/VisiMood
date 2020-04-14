import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//import './addMood.dart';

class CalendarPage extends StatefulWidget{

  DateTime datePicked;
  CalendarPage({Key key, @required this.datePicked}) : super(key : key);

  @override
  CalendarState createState() => CalendarState(datePicked);
}

class CalendarState extends State<CalendarPage> {
  CalendarController _controller;
  DateTime datePicked;
  CalendarState(this.datePicked);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CalendarController(
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TableCalendar(
                calendarStyle: CalendarStyle(
                    todayColor: Colors.amber[800],
                    selectedColor: Colors.amber,
                    todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    )),
                calendarController: _controller,
              ),
//              Text(this.datePicked.toString(),
//              ),
            ],
          )),
    );
  }
}