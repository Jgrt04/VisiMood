import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'mood_chart.dart';
import 'mood_series.dart';

class Trends extends StatelessWidget{

  final List<MoodSeries> data =[
    MoodSeries(
      time: "19",
      rating: 3,
      chartColor: charts.ColorUtil.fromDartColor(Colors.orange),
    ),
    MoodSeries(
      time: "20",
      rating: 2,
      chartColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    MoodSeries(
      time: "21",
      rating: 2,
      chartColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    MoodSeries(
      time: "22",
      rating: 4,
      chartColor: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
    MoodSeries(
      time: "23",
      rating: 5,
      chartColor: charts.ColorUtil.fromDartColor(Colors.amber),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MoodChart(data: data),
      ),

    );
  }
}