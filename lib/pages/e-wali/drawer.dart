import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Test"),
            accountEmail: const Text("test@mail.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
          ),
          ListTile(
            leading: Image.asset('assets/icon_krs.png', height: 20),
            title: const Text("KRS MAHASISWA"),
            onTap: () {
              Get.toNamed(
                '/krs-mahasiswa',
              );
            },
          ),
          ListTile(
            leading: Image.asset('assets/icon_line_chart.png', height: 20),
            title: const Text("GRAFIK IPK/SKS"),
            onTap: () {
              Get.toNamed(
                '/grafik',
              );
            },
          ),
          ListTile(
            leading: Image.asset('assets/icon_payment.png', height: 20),
            title: const Text("HISTORY PEMBAYARAN"),
            onTap: () {
              Get.toNamed(
                '/history-pembayaran',
              );
            },
          ),
          ListTile(
            leading: Image.asset('assets/icon_setting.png', height: 20),
            title: const Text("SETTING"),
            onTap: () {
              Get.toNamed(
                '/setting',
              );
            },
          ),
          ListTile(
            leading: Image.asset('assets/icon_logout.png', height: 20),
            title: const Text("Logout"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
