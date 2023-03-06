import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main(List<String> args) {
  runApp(MyPOC());
}

class MyPOC extends StatefulWidget {
  MyPOC({super.key});

  @override
  State<MyPOC> createState() => _MyPOCState();
}

class _MyPOCState extends State<MyPOC> {
  late List<ChartSampleData> _chartData;
  late ZoomPanBehavior _zoomPanBehavior;

  late TrackballBehavior _trackballBehavior;
  late bool _toggleVisibility;
  late bool _enableSolidCandle;
  ChartSeriesController? SeriesController;

  @override
  void initState() {
    // TODO: implement initState
    _toggleVisibility = true;
    super.initState();

    _zoomPanBehavior = ZoomPanBehavior(
        enableDoubleTapZooming: true,
        enablePanning: true,
        enablePinching: true,
        enableSelectionZooming: true);
    _enableSolidCandle = false;
    _chartData = getData();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
  }

  List<ChartSampleData> getData() {
    return <ChartSampleData>[
      ChartSampleData(
        X: DateTime(2016, 12, 12),
        open: 115.8,
        close: 113.2,
        high: 112.4,
        low: 119,
      ),
      ChartSampleData(
        X: DateTime(2016, 13, 12),
        open: 117.8,
        close: 118.2,
        high: 119.4,
        low: 121,
      ),
      ChartSampleData(
        X: DateTime(2016, 14, 12),
        open: 117.8,
        close: 118.2,
        high: 125.4,
        low: 121,
      ),
      ChartSampleData(
        X: DateTime(2016, 15, 12),
        open: 118.8,
        close: 112.2,
        high: 125.4,
        low: 115,
      ),
      ChartSampleData(
        X: DateTime(2016, 16, 12),
        open: 113.8,
        close: 115.2,
        high: 112.4,
        low: 119,
      ),
      ChartSampleData(
        X: DateTime(2016, 17, 12),
        open: 115.8,
        close: 113.2,
        high: 112.4,
        low: 119,
      ),
      ChartSampleData(
        X: DateTime(2016, 18, 12),
        open: 115.8,
        close: 113.2,
        high: 112.4,
        low: 119,
      ),
      ChartSampleData(
        X: DateTime(2016, 19, 12),
        open: 115.8,
        close: 113.2,
        high: 112.4,
        low: 119,
      ),
      ChartSampleData(
        X: DateTime(2016, 20, 12),
        open: 115.8,
        close: 113.2,
        high: 112.4,
        low: 119,
      ),
      ChartSampleData(
        X: DateTime(2016, 21, 12),
        open: 115.8,
        close: 113.2,
        high: 112.4,
        low: 119,
      ),
      ChartSampleData(
        X: DateTime(2016, 22, 12),
        open: 115.8,
        close: 113.2,
        high: 112.4,
        low: 119,
      ),
      ChartSampleData(
        X: DateTime(2016, 23, 12),
        open: 115.8,
        close: 113.2,
        high: 112.4,
        low: 119,
      ),
      ChartSampleData(
        X: DateTime(2016, 24, 12),
        open: 115.8,
        close: 113.2,
        high: 112.4,
        low: 119,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Nykaa - FSN E- Commerce Ventures Ltd.",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                "Nykaa",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                width: double.infinity,
                // color: Colors.amber,
                child: Column(
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: SfCartesianChart(
                        // zoomPanBehavior: _zoomPanBehavior,

                        trackballBehavior: _trackballBehavior,
                        borderColor: Colors.black,
                        enableAxisAnimation: true,
                        // legend: Legend(isVisible: true),
                        series: [
                          CandleSeries<ChartSampleData, DateTime>(
                            bullColor: Colors.green,
                            showIndicationForSameValues: false,
                            bearColor: Colors.red,
                            enableSolidCandles: true,
                            name: "NSE",
                            dataSource: _chartData,
                            xValueMapper: (ChartSampleData sales, _) => sales.X,
                            closeValueMapper: (ChartSampleData sales, _) =>
                                sales.close,
                            lowValueMapper: (ChartSampleData sales, _) =>
                                sales.low,
                            highValueMapper: (ChartSampleData sales, _) =>
                                sales.high,
                            openValueMapper: (ChartSampleData sales, _) =>
                                sales.open,
                          )
                        ],
                        primaryXAxis: DateTimeAxis(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400]),
                    onPressed: () {},
                    child: Text("BUY"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400]),
                    onPressed: () {},
                    child: Text("SELL"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
}

class ChartSampleData {
  ChartSampleData({
    this.X,
    this.open,
    this.close,
    this.low,
    this.high,
  });

  DateTime? X;
  num? open;
  num? close;
  num? low;
  num? high;
}
