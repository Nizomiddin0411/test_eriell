import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('import', 25, 'export'),
      ChartData('import ', 38, 'import'),
      ChartData('export', 34, 'iii'),
    ];
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Eriell')),
          ),
          body: orientation == Orientation.portrait
              ? Column(
                  children: [
                    Expanded(
                        child: SfCircularChart(series: <CircularSeries>[
                      // Render pie chart
                      PieSeries<ChartData, String>(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _) => data.label ?? '',
                        yValueMapper: (ChartData data, _) => data.y,
                        radius: '70%',
                        dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            labelPosition: ChartDataLabelPosition.outside,
                            labelIntersectAction: LabelIntersectAction.shift,
                            connectorLineSettings: ConnectorLineSettings(
                                type: ConnectorType.line, length: '2%')),
                      )
                    ])),
                    Expanded(
                      child: buildDataTable(),
                    ),
                  ],
                )
              : buildDataTable(),
        );
      },
    );
  }

  Widget buildDataTable() {
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(label: Text('No')),
          DataColumn(label: Text('Surname')),
          DataColumn(label: Text('name')),
          DataColumn(label: Text('Age')),
        ],
        rows: List<DataRow>.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Text('$index')),
              DataCell(Text('temirov ')),
              DataCell(Text('nizom ')),
              DataCell(Text(' ${index * 1}')),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
    this.label,
  );

  final String x;
  final double y;
  final String? label;
}
