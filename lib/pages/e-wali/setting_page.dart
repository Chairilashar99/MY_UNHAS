import 'package:flutter/material.dart';
import 'package:flutter_e_wali/pages/e-wali/drawer.dart';
import 'package:flutter_e_wali/theme.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    // Widget header
    PreferredSizeWidget header() {
      return AppBar(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
        title: Text('Welcome to App E-Wall'),
      );
    }

    // Widget profile
    Widget profile() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: defaultMargin),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50, // Anda dapat menyesuaikan ukurannya
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"), // Anda bisa mengganti URL ini dengan URL foto profil Anda
              ),
              SizedBox(height: 10),
              Text(
                "Nama Anda",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "L015231150",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Widget listTile
    Widget settingListTile() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            const Divider(thickness: 2.0),
            ListTile(
              title: const Text('Ubah Profil'),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 14.0, color: Colors.black),
              onTap: () {},
            ),
            const Divider(thickness: 2.0),
            ListTile(
              title: const Text('Ubah Password'),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 14.0, color: Colors.black),
              onTap: () {},
            ),
            const Divider(thickness: 2.0),
            ListTile(
              title: const Text('About'),
              trailing: const Icon(Icons.arrow_forward_ios,
                  size: 14.0, color: Colors.black),
              onTap: () {},
            ),
            const Divider(thickness: 2.0),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: header(),
      drawer: AppDrawer(),
      body: SafeArea(
        child: ListView(
          children: [
            profile(),
            settingListTile(),
          ],
        ),
      ),
    );
  }
}
