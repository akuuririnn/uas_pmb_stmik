import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pmb_stmik/pages/DaftarMahasiswa.dart';
import '../pages/login_screen.dart';
import 'firebase_options.dart';
import 'pages/ForgotPassword.dart';
import 'pages/FormPendaftaran.dart';
import 'pages/dashboardScreen.dart';
import 'pages/home.dart';
import 'pages/register_screen.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PMB-Stmik',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
      routes: {
        '/start': (context) => const Home(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/reset': (context) => const ForgotPasswordScreen(),
        '/DaftarMahasiswa': (context) => DaftarMahasiswa(),
        '/FormMahasiswa': (context) => FormPendaftaran(),
      },
    );
  }
}
