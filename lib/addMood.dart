import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
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

        ],
      ),
    );
  }
}
