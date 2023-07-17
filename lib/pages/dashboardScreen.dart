import 'package:flutter/material.dart';
import '../pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'DaftarMahasiswa.dart';
import 'FormPendaftaran.dart';
import 'ProfilePage.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Halaman Utama",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.ac_unit,
                    size: 50,
                  ),
                  Text(
                    'Penerimaan Mahasiswa Baru STMIK "AMIKBANDUNG"',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.home), // Add the icon here
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const DashboardScreen();
                }));
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.assignment_ind),
              title: const Text('Daftar Mahasiswa'),
              onTap: () {
                // TODO: Handle presensi
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return DaftarMahasiswa();
                }));
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.add_box),
              title: const Text('Pendaftaran'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return FormPendaftaran();
                }));
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }));
              },
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.black),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((_) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                });
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(10),
                  child: const Text(
                    "Halo, Selamat Datang !",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(10),
                  color: Colors.grey.shade300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        Center(
                          child: Text(
                            "INFO PENERIMAAN MAHASISWA BARU",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Pendaftaran          :     11 Mei 2023 \nSeleksi                   :     21 - 23 Juni 2023 \nPenerimaan          :     27 Juni 2023",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(10),
                  child: const Text("Menu Utama",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.list_alt),
                              onPressed: () {
                                // Aksi yang ingin dilakukan saat tombol ikon ditekan
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DaftarMahasiswa();
                                }));
                              },
                              color: Colors.black,
                            ),
                            const Text(
                              "     Daftar\n Mahasiswa",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.add_box_rounded),
                              onPressed: () {
                                // Aksi yang ingin dilakukan saat tombol ikon ditekan
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FormPendaftaran();
                                }));
                              },
                              color: Colors.black,
                            ),
                            const Text(
                              "Pendaftaran",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.contact_mail),
                              onPressed: () {
                                // Aksi yang ingin dilakukan saat tombol ikon ditekan
                              },
                              color: Colors.black,
                            ),
                            const Text(
                              "Seleski",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            IconButton(
                              icon: Icon(Icons.account_circle),
                              onPressed: () {
                                // Aksi yang ingin dilakukan saat tombol ikon ditekan
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ProfilePage();
                                }));
                              },
                              color: Colors.black,
                            ),
                            const Text(
                              "Profile",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.all(10),
                  child: const Text("Jadwal PMB",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 10),
                DataTable(
                  columnSpacing: 40,
                  border: TableBorder.symmetric(
                      inside: const BorderSide(color: Colors.grey),
                      outside: const BorderSide(color: Colors.black38)),
                  columns: const [
                    DataColumn(label: Text('No.   ')),
                    DataColumn(label: Text('Jadwal')),
                    DataColumn(label: Text('Tanggal')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('1')),
                      DataCell(Text('Pendaftaran')),
                      DataCell(Text('11 Mei 2023')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('2')),
                      DataCell(Text('Seleksi')),
                      DataCell(Text('21 - 23 Juni 2023')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('3')),
                      DataCell(Text('Penerimaan')),
                      DataCell(Text('27 Juni 2023')),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
