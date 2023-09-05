import 'package:flutter/material.dart';
import 'package:flutter_e_wali/pages/e-wali/drawer.dart';

class HistoryPembayaran {
  HistoryPembayaran({
    required this.no,
    required this.semester,
    required this.pembayaran_semester,
  });

  int no;
  String semester;
  String pembayaran_semester;
}

class HistoryPembayaranPage extends StatefulWidget {
  const HistoryPembayaranPage({super.key});

  @override
  State<HistoryPembayaranPage> createState() => _HistoryPembayaranPageState();
}

class _HistoryPembayaranPageState extends State<HistoryPembayaranPage> {
  List<HistoryPembayaran> history_pembayaran = [
    HistoryPembayaran(
      no: 1,
      semester: 'Semester 1',
      pembayaran_semester: 'sudah di bayar',
    ),
    HistoryPembayaran(
      no: 2,
      semester: 'Semester 2',
      pembayaran_semester: 'belum di bayar',
    ),
    HistoryPembayaran(
      no: 3,
      semester: 'Semester 3',
      pembayaran_semester: 'sudah di bayar',
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
            'Pembayaran ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
        rows: history_pembayaran.map((e) {
          return DataRow(cells: [
            DataCell(Text(e.no.toString())),
            DataCell(Text(e.semester)),
            DataCell(Text(e.pembayaran_semester)),
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
          dataTable(),
        ],
      )),
    );
  }
}
