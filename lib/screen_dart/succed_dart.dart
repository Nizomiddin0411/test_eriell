import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SuccessScreen extends StatelessWidget {
  SuccessScreen({super.key});

  var Peoplemonthly = [
    {
      "id": "1",
      "name": "hamidov",
      "surname": "Karim",
      "Salary": "455",
    },
    {
      "id": "2",
      "name": "Botirov",
      "surname": "Ruslan",
      "Salary": "991",
    },
    {
      "id": "3",
      "name": "Majidov",
      "surname": "Vali",
      "Salary": "450",
    },
    {
      "id": "4",
      "name": "Samadov",
      "surname": "Ali",
      "Salary": "200",
    },
    {
      "id": "5",
      "name": "Jalilov",
      "surname": "Jamshid",
      "Salary": "550",
    },
    {
      "id": "6",
      "name": "Denisov",
      "surname": "Bogdan",
      "Salary": "850",
    },
    {
      "id": "7",
      "name": "Samidov",
      "surname": "Furqat",
      "Salary": "450",
    },
    {
      "id": "8",
      "name": "Nataliya",
      "surname": "Ve",
      "Salary": "650",
    },
    {
      "id": "9",
      "name": "Kim",
      "surname": "Yo",
      "Salary": "500",
    },
    {
      "id": "10",
      "name": "Sattarov",
      "surname": "nurjamshid",
      "Salary": "500",
    },
    {
      "id": "11",
      "name": "Denisov",
      "surname": "Bogdan",
      "Salary": "850",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<ChartData> _chartData = Peoplemonthly.map((e) => ChartData(
            e['name']!, e['Salary'] != null ? int.parse(e['Salary']!) : 0))
        .toList();
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
                        dataSource: _chartData,
                        xValueMapper: (ChartData data, _) => data.x,
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
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Salary')),
          ],
          rows: Peoplemonthly.map((item) {
            return DataRow(cells: [
              DataCell(Text(item['id'].toString())),
              // Use 'e' instead of 'item'
              DataCell(Text(item['surname'].toString())),

              DataCell(Text(item['name'].toString())),
              DataCell(Text(item['Salary'].toString())),
            ]);
          }).toList()),
    );
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
  );

  final String x;
  final int y;
}
