import 'package:flutter/material.dart';
import 'package:flutter_e_wali/pages/e-wali/drawer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../theme.dart';

class IPK {
  IPK({
    required this.no,
    required this.semester,
    required this.ips,
    required this.ipk,
  });

  int no;
  String semester;
  String ips;
  String ipk;
}

class SKS {
  SKS({
    required this.no,
    required this.semester,
    required this.sks_semester,
    required this.sks_kumulatif,
  });

  int no;
  String semester;
  String sks_semester;
  String sks_kumulatif;
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double y;
}

final List<ChartData> chartData = [
  ChartData(DateTime(2015, 1), 6),
  ChartData(DateTime(2016, 1), 11),
  ChartData(DateTime(2017, 1), 9),
  ChartData(DateTime(2018, 1), 14),
  ChartData(DateTime(2019, 1), 10),
];

class GrafikPage extends StatefulWidget {
  const GrafikPage({super.key});

  @override
  State<GrafikPage> createState() => _GrafikPageState();
}

class _GrafikPageState extends State<GrafikPage> {
  String dropdownValue = 'IPK';
  final List<String> dropdownItems = ['IPK', 'SKS'];

  List<IPK> ipk = [
    IPK(
      no: 1,
      semester: 'Semester 1',
      ips: '10.75',
      ipk: '3.58',
    ),
    IPK(
      no: 2,
      semester: 'Semester 2',
      ips: '10.60',
      ipk: '3.57',
    ),
    IPK(
      no: 3,
      semester: 'Semester 3',
      ips: '10.70',
      ipk: '3.63',
    ),
  ];

  List<SKS> sksData = [
    SKS(
      no: 1,
      semester: 'Semester 1',
      sks_semester: '10',
      sks_kumulatif: '10',
    ),
    SKS(
      no: 2,
      semester: 'Semester 2',
      sks_semester: '12',
      sks_kumulatif: '22',
    ),
    SKS(
      no: 3,
      semester: 'Semester 3',
      sks_semester: '11',
      sks_kumulatif: '33',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Widget header
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        title: Text('Welcome to App E-Wali'),
      );
    }

    // Widget dropdown
    Widget dropDown() {
      return Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: defaultMargin, top: 8, bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey[900],
            ),
            height: 40,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                hint:
                    Text(dropdownValue, style: TextStyle(color: Colors.white)),
                dropdownColor: Colors.blueGrey[900],
                icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                iconSize: 24,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue.toString();
                  });
                },
                items:
                    dropdownItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      );
    }

    //Widget chart
    Widget chart() {
      return Container(
          color: Theme.of(context).cardColor,
          padding: const EdgeInsets.all(12.0),
          child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(),
              series: <ChartSeries<ChartData, DateTime>>[
                LineSeries<ChartData, DateTime>(
                    dataSource: chartData,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y)
              ]));
    }

    // Widget table
    Widget dataTable() {
      return DataTable(
        columns: const [
          DataColumn(
              label: Text(
            'No',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Text(
            'Semester',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Text(
            'IPS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Text(
            'IPK',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ))
        ],
        rows: ipk.map((e) {
          return DataRow(cells: [
            DataCell(Text(e.no.toString())),
            DataCell(Text(e.semester)),
            DataCell(Text(e.ips)),
            DataCell(Text(e.ipk)),
          ]);
        }).toList(),
      );
    }

    Widget dataTableSKS() {
      return DataTable(
        columns: const [
          DataColumn(
              label: Text(
            'No',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Text(
            'Semester',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Text('SKS Semester',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),
          DataColumn(
              label: Text(
            'SKS Kumulatif',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
        rows: sksData.map((e) {
          return DataRow(cells: [
            DataCell(Text(e.no.toString())),
            DataCell(Text(e.semester)),
            DataCell(Text(e.sks_semester)),
            DataCell(Text(e.sks_kumulatif)),
          ]);
        }).toList(),
      );
    }

    return Scaffold(
      appBar: header(),
      drawer: AppDrawer(),
      body: SafeArea(
          child: ListView(
        children: [
          dropDown(),
          chart(),
          dropdownValue == 'IPK' ? dataTable() : dataTableSKS(),
        ],
      )),
    );
  }
}
