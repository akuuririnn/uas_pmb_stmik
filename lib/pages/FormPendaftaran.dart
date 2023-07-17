import 'package:flutter/material.dart';
import 'dashboardScreen.dart';

class FormPendaftaran extends StatefulWidget {
  @override
  _FormPendaftaranState createState() => _FormPendaftaranState();
}

class _FormPendaftaranState extends State<FormPendaftaran> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();
  final TextEditingController _jurusanController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    _alamatController.dispose();
    _jurusanController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Kirim data ke server atau lakukan tindakan lain di sini
      String nama = _namaController.text;
      String email = _emailController.text;
      String alamat = _alamatController.text;
      String jurusan = _jurusanController.text;

      // Tampilkan dialog sukses atau lakukan tindakan lain
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Data telah berhasil disimpan.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return FormPendaftaran();
                  }));
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const DashboardScreen();
              }));
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text('Tambah Data Mahasiswa'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(labelText: 'Alamat'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _jurusanController,
                decoration: InputDecoration(labelText: 'Jurusan'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your major';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
