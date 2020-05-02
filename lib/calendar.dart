import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter2/trends.dart';
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
  //TextEditingController _eventController;
  SharedPreferences prefs;

//  CalendarState(this.datePicked);
  CalendarState({this.addmood});

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    //_eventController = TextEditingController();
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
                  selectedColor: Colors.amber[700],
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

    //result is the highest mood and strength

//    Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => Trends()),
//    );

    print("event Added");

    if (result == null) {
      return;
    } else {
      setState(() {
        if (_events[_controller.selectedDay] != null) {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("Mood added")));
          _events[_controller.selectedDay].add("$result");
          print("1 ${_events[_controller.selectedDay]}");
        } else {
          Scaffold.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("Mood added")));
          _events[_controller.selectedDay] = ["$result"];
          print("2 ${_events[_controller.selectedDay]}");
        }
        prefs.setString("events", json.encode(encodeMap(_events)));
        //_eventController.clear();
        //Navigator.pop(context);
      });
    }
    }
}

class AddMood extends StatefulWidget {
  final double happyRating;
  final double sadRating;
  final double angryRating;
  final double stressRating;
  final double anxiousRating;

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
              List<double> moodList = [_happyRating, _sadRating, _angryRating, _anxiousRating, _stressRating];
              moodList.sort();

              print(moodList.toString());

              if(moodList[4] == _happyRating){
                print("before pop");
                Navigator.pop(context, "Happy: $_happyRating");
                print("after pop");
              } else if(moodList[4] == _sadRating){
                Navigator.pop(context, "Sad: $_sadRating");
              }else if(moodList[4] == _angryRating){
                Navigator.pop(context, "Anger: $_angryRating");
              }else if(moodList[4] == _anxiousRating){
                Navigator.pop(context, "Anxious: $_anxiousRating");
              }else if(moodList[4] == _stressRating){
                Navigator.pop(context, "Stress: $_stressRating");
              }
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
