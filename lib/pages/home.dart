import 'package:flutter/material.dart';
import '../pages/login_screen.dart';
import '../pages/register_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.blue,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Sekolah Tinggi Management",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Informatika Dan Komputer",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      'STMIK "AMIKBANDUNG"',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        height: 250,
                        width: 250,
                        child: Image.asset("assets/amik.png")),
                    SizedBox(height: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            child: const Text('LOGIN'),
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Close the previous page
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            child: const Text('SIGNUP'),
                            onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
