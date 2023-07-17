import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  // Form key
  final _formKey = GlobalKey<FormState>();

  // Editing controller
  final TextEditingController emailController = TextEditingController();

  // Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to handle password reset
  Future<void> _resetPassword() async {
    try {
      final String email = emailController.text.trim();

      // Validate form input
      if (_formKey.currentState!.validate()) {
        // Send password reset email
        await _auth.sendPasswordResetEmail(email: email);

        // Password reset email sent successfully
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Password Reset Email Sent'),
              content: const Text('Please check your email to reset your password.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Handle password reset errors
      // TODO: Handle password reset errors based on the specific exception
      print('Password reset failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Reset password button
    final resetButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: _resetPassword,
        child: Text(
          "RESET PASSWORD",
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
                      "Forgot Password",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(height: 35),
                    resetButton,
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
