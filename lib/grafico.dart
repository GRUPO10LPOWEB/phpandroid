import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class graf extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  graf(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory graf.withSampleData() {
    return new graf(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.TimeSeriesChart(
      _createSampleData(),
      animate: false,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      new TimeSeriesSales(new DateTime(2017, 9, 19), 0),
      new TimeSeriesSales(new DateTime(2017, 9, 26), 25),
      new TimeSeriesSales(new DateTime(2017, 10, 3), 50),
      new TimeSeriesSales(new DateTime(2017, 10, 10), 75),
      new TimeSeriesSales(new DateTime(2017, 11, 10), 80),
      new TimeSeriesSales(new DateTime(2017, 12, 10), 65),
      new TimeSeriesSales(new DateTime(2018, 2, 10), 90),
      new TimeSeriesSales(new DateTime(2018, 4, 10), 55),
      new TimeSeriesSales(new DateTime(2018, 8, 10), 75),
      new TimeSeriesSales(new DateTime(2018, 10, 10), 45),
      new TimeSeriesSales(new DateTime(2018, 12, 10), 32),
      new TimeSeriesSales(new DateTime(2019, 8, 10), 85),
      new TimeSeriesSales(new DateTime(2019, 9, 10), 100),
      new TimeSeriesSales(new DateTime(2019, 10, 10), 50),
      new TimeSeriesSales(new DateTime(2019, 12, 10), 40),
      new TimeSeriesSales(new DateTime(2020, 1, 10), 30),
    ];

    return [
      new charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  final DateTime time;
  final int sales;

  TimeSeriesSales(this.time, this.sales);
}