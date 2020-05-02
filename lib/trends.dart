import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'mood_chart.dart';
import 'mood_series.dart';

class Trends extends StatelessWidget{

  final List<MoodSeries> data =[
    MoodSeries(
      //stress
      time: "19",
      rating: 3,
      chartColor: charts.ColorUtil.fromDartColor(Colors.deepOrangeAccent),
    ),
    MoodSeries(
      //sad
      time: "20",
      rating: 2,
      chartColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    MoodSeries(
      //angry
      time: "21",
      rating: 2,
      chartColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    MoodSeries(
      //anxious
      time: "22",
      rating: 4,
      chartColor: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
    MoodSeries(
      time: "23",
      rating: 5,
      chartColor: charts.ColorUtil.fromDartColor(Colors.amber),
    ),
    MoodSeries(
      time: "24",
      rating: 4,
      chartColor: charts.ColorUtil.fromDartColor(Colors.deepOrangeAccent),
    ),
    MoodSeries(
      time: "26",
      rating: 3,
      chartColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    MoodSeries(
      time: "27",
      rating: 4,
      chartColor: charts.ColorUtil.fromDartColor(Colors.amber),
    ),
    MoodSeries(
      time: "28",
      rating: 5,
      chartColor: charts.ColorUtil.fromDartColor(Colors.amber),
    ),
    MoodSeries(
      time: "29",
      rating: 4,
      chartColor: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
    MoodSeries(
      time: "30",
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