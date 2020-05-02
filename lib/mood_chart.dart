import 'package:flutter/material.dart';
import 'package:flutter2/mood_series.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class MoodChart extends StatelessWidget {
  final List<MoodSeries> data;

  MoodChart({this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<MoodSeries, String>> series = [
      charts.Series(
          id: "Moods",
          data: data,
          domainFn: (MoodSeries series, _) => series.time,
          measureFn: (MoodSeries series, _) => series.rating,
          colorFn: (MoodSeries series, _) => series.chartColor)
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              Text(
                "April 2020",
                style: Theme
                    .of(context)
                    .textTheme
                    .body2,
              ),
              Expanded(
                  child: charts.BarChart(series, animate: true,)
              )
            ],
          ),
        ),
      ),
    );
  }
}

