import 'package:flutter/material.dart';
import 'package:flutter_e_wali/pages/e-wali/grafik_page.dart';
import 'package:flutter_e_wali/pages/e-wali/history_pembayaran_page.dart';
import 'package:flutter_e_wali/pages/e-wali/krs_mahasiswa_page.dart';
import 'package:flutter_e_wali/pages/e-wali/setting_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/krs-mahasiswa",
      debugShowCheckedModeBanner: false,
      routes: {
        '/krs-mahasiswa': (context) => KrsMahasiswaPage(),
        '/grafik': (context) => GrafikPage(),
        '/history-pembayaran': (context) => HistoryPembayaranPage(),
        '/setting': (context) => SettingPage(),
      },
    );
  }
}
