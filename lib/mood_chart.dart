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

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  height: 500,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "May 2020",
                            style: Theme.of(context).textTheme.body2,
                          ),
                          Expanded(
                              child: charts.BarChart(
                            series,
                            animate: true,
                            behaviors: [
                              new charts.SlidingViewport(),
                              new charts.PanAndZoomBehavior(),
                            ],
                            domainAxis: new charts.OrdinalAxisSpec(
                                viewport: new charts.OrdinalViewport('5', 5)),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 400,
                  padding: EdgeInsets.all(10),
                  child: Card(
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(140),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: Text(
                            "Another Graph Here",
                            style: Theme.of(context).textTheme.body2,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

  }
}
