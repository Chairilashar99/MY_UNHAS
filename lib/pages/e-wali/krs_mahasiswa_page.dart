import 'package:flutter/material.dart';
import 'package:flutter_e_wali/pages/e-wali/drawer.dart';

class KRS {
  KRS({
    required this.no,
    required this.kelas,
    required this.kode,
    required this.mataKuliah,
    required this.nama,
    required this.sks,
    required this.ruangan,
  });

  int no;
  String kelas;
  String kode;
  String mataKuliah;
  String nama;
  String sks;
  String ruangan;
}

class KrsMahasiswaPage extends StatefulWidget {
  const KrsMahasiswaPage({super.key});

  @override
  State<KrsMahasiswaPage> createState() => _KrsMahasiswaPageState();
}

class _KrsMahasiswaPageState extends State<KrsMahasiswaPage> {
  String? dropdownValue;
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];

  List<KRS> krs = [
    KRS(
        no: 1,
        kelas: 'Kelas A',
        kode: 'UH180111',
        mataKuliah: 'Pendidikan Agama',
        nama: 'Pendidikan',
        sks: '8',
        ruangan: 'Lab Telematika'),
    KRS(
        no: 2,
        kelas: 'Kelas B',
        kode: 'UH180112',
        mataKuliah: 'Kimia Dasar',
        nama: 'Pendidikan',
        sks: '8',
        ruangan: 'Ground 01 CR50'),
    KRS(
        no: 3,
        kelas: 'Kelas C',
        kode: 'UH180113',
        mataKuliah: 'Fisika Dasar',
        nama: 'Pendidikan',
        sks: '8',
        ruangan: 'Lantai 1 102'),
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
            'Kelas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Text(
            'Kode',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Text(
            'Mata Kuliah',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Text(
            'Nama',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Text(
            'SKS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
          DataColumn(
              label: Text(
            'Ruangan',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )),
        ],
        rows: krs.map((e) {
          return DataRow(cells: [
            DataCell(Text(e.no.toString())),
            DataCell(Text(e.kelas)),
            DataCell(Text(e.kode)),
            DataCell(Text(e.mataKuliah)),
            DataCell(Text(e.nama)),
            DataCell(Text(e.sks)),
            DataCell(Text(e.ruangan)),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: dataTable(),
            ),
          ],
        ),
      ),
    );
  }
}
