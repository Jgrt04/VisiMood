import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter2/calendar.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime currentTime, LocaleType locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex()
          )
        : DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex()
          );
  }
}

class AddMood extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddMoodState();
}

class AddMoodState extends State<AddMood> {
  double _happyRating = 0.0;
  double _sadRating = 0.0;
  double _angryRating = 0.0;
  double _stressRating = 0.0;
  double _anxiousRating = 0.0;
  DateTime datePicked = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2018, 3, 5),
                          maxTime: DateTime(2020, 12, 7),
                          theme: DatePickerTheme(
                              headerColor: Colors.white,
                              backgroundColor: Colors.white,
                              itemStyle: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              doneStyle:
                                  TextStyle(color: Colors.black, fontSize: 16)),
                          onChanged: (date) {
                        print('change $date in time zone ' +
                            date.timeZoneOffset.inHours.toString());
                      }, onConfirm: (date) {
                        print('confirm $date');
                        datePicked = date;
                        setState(() => datePicked = date);
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    color: Colors.black12,
                    elevation: 0.0,
                    child: Text(
                      'Select a Date',
                      style: TextStyle(color: Colors.purpleAccent),
                    )),
              ],
            ),
          ),
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
              print(_happyRating);
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
          Row(
            children: <Widget>[
              new Text("Date picked = $datePicked"),
              RaisedButton(
                child: Text("Add Mood"),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CalendarPage(datePicked : datePicked),
                  ));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
