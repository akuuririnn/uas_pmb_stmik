import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmb_stmik/pages/dashboardScreen.dart';
import 'ForgotPassword.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Form key
  final _formKey = GlobalKey<FormState>();

  // Editing controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to handle login
  Future<void> _login() async {
    try {
      final String email = emailController.text.trim();
      final String password = passwordController.text;

      // Validate form inputs
      if (_formKey.currentState!.validate()) {
        // Sign in with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Login successful, show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login successful'),
            duration: Duration(seconds: 2),
          ),
        );

        // Navigate to dashboard screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      }
    } catch (e) {
      // Handle login errors
      // TODO: Handle login errors based on the specific exception
      print('Login failed: $e');

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        //validator: () {},
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,

        //validator: () {},
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: _login, // Call the _login function
        child: Text(
          "LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 24),
                    const Text(
                      "Welcome!",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Sign in to continue",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 25),
                    passwordField,
                    SizedBox(height: 35),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPasswordScreen())
                            );
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(
                            "Forgot Password",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                    loginButton,
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Don't have an Account ?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterScreen()),
                            );
                          },
                          child: Text(
                            " Sign Up",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        )
                      ],
                    )
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
