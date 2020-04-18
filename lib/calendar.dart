import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './addMood.dart';

class CalendarPage extends StatefulWidget {
  DateTime datePicked;
  CalendarPage({Key key, @required this.datePicked}) : super(key: key);

  @override
  CalendarState createState() => CalendarState(datePicked);
}

class CalendarState extends State<CalendarPage> {
  CalendarController _controller;
  DateTime datePicked;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

  CalendarState(this.datePicked);

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    initPrefs();
  }

  initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _events = Map<DateTime, List<dynamic>>.from(
          decodeMap(json.decode(prefs.getString("events") ?? "{}")));
    });
  }

  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              calendarStyle: CalendarStyle(
                  todayColor: Colors.black12,
                  selectedColor: Colors.amber,
                  todayStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: Colors.white,
                  )),
              calendarController: _controller,
              onDaySelected: (date, events) {
                setState(() {
                  _selectedEvents = events;
                });
              },
            ),
            ..._selectedEvents.map((event) => ListTile(
                  title: Text(event),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add Mood'),
        icon: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }

  _showAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _eventController,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    if (_eventController.text.isEmpty) return;
                    setState(() {
                      if (_events[_controller.selectedDay] != null) {
                        _events[_controller.selectedDay]
                            .add(_eventController.text);
                      } else {
                        _events[_controller.selectedDay] = [
                          _eventController.text
                        ];
                      }
                      prefs.setString(
                          "events", json.encode(encodeMap(_events)));
                      _eventController.clear();
                      Navigator.pop(context);
                    });
                  },
                )
              ],
            ));
  }
}
