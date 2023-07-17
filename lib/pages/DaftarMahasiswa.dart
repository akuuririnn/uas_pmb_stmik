import 'package:flutter/material.dart';

import 'dashboardScreen.dart';

class DaftarMahasiswa extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'nama': 'John Doe',
      'email': 'johndoe@example.com',
      'alamat': '123 Main St, City',
      'jurusan': 'Informatika',
    },
    {
      'nama': 'Jane Smith',
      'email': 'janesmith@example.com',
      'alamat': '456 Oak St, City',
      'jurusan': 'Sistem Informasi',
    },
    // Tambahkan data lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const DashboardScreen();
              }));
            }, 
            icon: const Icon(Icons.arrow_back)),
        title: Text('Data Mahasiswa'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: [
            DataColumn(label: Text('Nama')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Alamat')),
            DataColumn(label: Text('Jurusan')),
          ],
          rows: data
              .map(
                (item) => DataRow(
                  cells: [
                    DataCell(Text(item['nama']!)),
                    DataCell(Text(item['email']!)),
                    DataCell(Text(item['alamat']!)),
                    DataCell(Text(item['jurusan']!)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
