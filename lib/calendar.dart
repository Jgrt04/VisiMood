import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarPage extends StatefulWidget {
//  DateTime datePicked;
//  CalendarPage({Key key, @required this.datePicked}) : super(key: key);

  final AddMood addmood;
  CalendarPage({this.addmood});

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<CalendarPage> {
  CalendarController _controller;
  DateTime datePicked;
  AddMood addmood;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  TextEditingController _eventController;
  SharedPreferences prefs;

//  CalendarState(this.datePicked);
  CalendarState({this.addmood});

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
                  title: Text(
                    event,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                )),
//            Text('Happy: ${addmood.happyRating}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Add Mood'),
        icon: Icon(Icons.add),
        onPressed: () {
          _navigateAndDisplay(context);
        },
//        onPressed: (){
//          Navigator.of(context).push(MaterialPageRoute(
//            builder: (context) => AddMood(),
//          ));
//        },
//        onPressed: _showAddDialog,
      ),
    );
  }

  _navigateAndDisplay(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddMood()),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text("Happiness: $result")));

    print("event Added");

    if (!result) return;
    setState(() {

      if (_events[_controller.selectedDay] != null) {
        _events[_controller.selectedDay].add("$result");

      } else {
        _events[_controller.selectedDay] = ["$result"];
      }
      prefs.setString("events", json.encode(encodeMap(_events)));
      _eventController.clear();
      //Navigator.pop(context);
    });
  }
}

class AddMood extends StatefulWidget {
  double happyRating;
  double sadRating;
  double angryRating;
  double stressRating;
  double anxiousRating;

  AddMood(
      {this.happyRating,
      this.sadRating,
      this.angryRating,
      this.stressRating,
      this.anxiousRating});

  @override
  State<StatefulWidget> createState() => AddMoodState();
}

class AddMoodState extends State<AddMood> {
  double _happyRating = 0.0;
  double _sadRating = 0.0;
  double _angryRating = 0.0;
  double _stressRating = 0.0;
  double _anxiousRating = 0.0;

  AddMoodState(
      {happyRating, sadRating, angryRating, stressRating, anxiousRating});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("How are you feeling?"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Happy',
            ),
          ),
          new Slider(
            value: _happyRating,
            onChanged: (newRating) {
              setState(() => _happyRating = newRating);
//              print(_happyRating);
            },
            activeColor: Colors.amberAccent,
            min: 0,
            max: 5,
            divisions: 5,
            label: _happyRating.toInt().toString(),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              'Sad',
            ),
          ),
          new Slider(
            value: _sadRating,
            onChanged: (newRating) {
              setState(() => _sadRating = newRating);
            },
            activeColor: Colors.blue,
            min: 0,
            max: 5,
            divisions: 5,
            label: _sadRating.toInt().toString(),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              'Angry',
            ),
          ),
          new Slider(
            value: _angryRating,
            onChanged: (newRating) {
              setState(() => _angryRating = newRating);
            },
            activeColor: Colors.red,
            min: 0,
            max: 5,
            divisions: 5,
            label: _angryRating.toInt().toString(),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              'Anxious',
            ),
          ),
          new Slider(
            value: _anxiousRating,
            onChanged: (newRating) {
              setState(() => _anxiousRating = newRating);
            },
            activeColor: Colors.purple,
            min: 0,
            max: 5,
            divisions: 5,
            label: _anxiousRating.toInt().toString(),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              'Stress',
            ),
          ),
          new Slider(
            value: _stressRating,
            onChanged: (newRating) {
              setState(() => _stressRating = newRating);
            },
            activeColor: Colors.orange,
            min: 0,
            max: 5,
            divisions: 5,
            label: _stressRating.toInt().toString(),
          ),
          RaisedButton(
            child: Text("Done"),
            onPressed: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => CalendarPage(
//                    addmood: moods,
//                  )));

              Navigator.pop(context, _happyRating);
            },
          ),
        ],
      ),
    );
  }
}

//  _showAddDialog() {
//    showDialog(
//        context: context,
//        builder: (context) => AlertDialog(
//              content: TextField(
//                controller: _eventController,
//              ),
//              actions: <Widget>[
//                FlatButton(
//                  child: Text("Save"),
//                  onPressed: () {
//                    if (_eventController.text.isEmpty) return;
//                    setState(() {
//                      if (_events[_controller.selectedDay] != null) {
//                        _events[_controller.selectedDay]
//                            .add(_eventController.text);
//                      } else {
//                        _events[_controller.selectedDay] = [
//                          _eventController.text
//                        ];
//                      }
//                      prefs.setString(
//                          "events", json.encode(encodeMap(_events)));
//                      _eventController.clear();
//                      Navigator.pop(context);
//                    });
//                  },
//                )
//              ],
//            ));
//  }
