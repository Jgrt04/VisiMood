import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'mood_chart.dart';
import 'mood_series.dart';

class Trends extends StatelessWidget{

  final List<MoodSeries> data =[
    MoodSeries(
      //stress
      time: "1",
      rating: 5,
      chartColor: charts.ColorUtil.fromDartColor(Colors.amber),
    ),
    MoodSeries(
      //stress
      time: "2",
      rating: 4,
      chartColor: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
    MoodSeries(
      //stress
      time: "3",
      rating: 4,
      chartColor: charts.ColorUtil.fromDartColor(Colors.deepOrangeAccent),
    ),
    MoodSeries(
      //stress
      time: "4",
      rating: 3,
      chartColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    MoodSeries(
      //stress
      time: "5",
      rating: 5,
      chartColor: charts.ColorUtil.fromDartColor(Colors.amber),
    ),

  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: MoodChart(data: data),
      );
  }
}