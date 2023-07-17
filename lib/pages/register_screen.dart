import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Form key
  final _formKey = GlobalKey<FormState>();

  // Editing controllers
  final TextEditingController userNameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController passwordEditingController = TextEditingController();
  final TextEditingController passwordConfirmEditingController = TextEditingController();

  // Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Registration message
  String registrationMessage = '';

  // Function to handle registration
  Future<void> _register() async {
    try {
      final String userName = userNameEditingController.text.trim();
      final String email = emailEditingController.text.trim();
      final String password = passwordEditingController.text;

      // Validate form inputs
      if (_formKey.currentState!.validate()) {
        // Create a new user with email and password
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Optional: You can also update the user's display name
        User? user = userCredential.user;
        if (user != null) {
          await user.updateDisplayName(userName);
        }

        // Registration successful
        setState(() {
          registrationMessage = 'Registration successful!';
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(registrationMessage),
            duration: Duration(seconds: 2),
          ),
        );

        // Navigate to login screen
        Navigator.of(context).pop();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } catch (e) {
      print('Registration failed: $e');

      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(registrationMessage),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Username field
    final userNameField = TextFormField(
      autofocus: false,
      controller: userNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
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

    // Password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Confirm password field
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: passwordConfirmEditingController,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != passwordEditingController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // Signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blue,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: _register,
        child: Text(
          "SIGNUP",
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
                      "Hi!",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "Create a new account",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 45),
                    userNameField,
                    SizedBox(height: 20),
                    emailField,
                    SizedBox(height: 20),
                    passwordField,
                    SizedBox(height: 20),
                    confirmPasswordField,
                    SizedBox(height: 20),
                    signUpButton,
                    SizedBox(height: 15),
                    Text(
                      registrationMessage,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            " Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
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
