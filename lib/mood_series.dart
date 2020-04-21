import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class MoodSeries {
  final String time;
  final int rating;
  final charts.Color chartColor;

  MoodSeries({
    @required this.time,
    @required this.rating,
    @required this.chartColor,
  });
}
