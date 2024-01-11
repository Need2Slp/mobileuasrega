import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobileuasrega/pages/button_navbar.dart';
import 'package:mobileuasrega/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false; // Track password visibility

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  bool isLoginValid() {
    String username = usernameController.text;
    String password = passwordController.text;

    return registeredUsers.containsKey(username) &&
        registeredUsers[username] == password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.cyan,
              Colors.indigo,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.white,
                ),
                Text(
                  'Login',
                  style: GoogleFonts.openSans(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Press The Button For Sign In',
                  style: GoogleFonts.mooli(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.grey,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.grey,
                      filled: true,
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    obscureText: !isPasswordVisible,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (isLoginValid()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Login Successful'),
                            content: Text('You have successfully logged in.'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ButtonNavbar(),
                                    ),
                                  );
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Login Failed'),
                            content: Text('Username or password is not valid.'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(200, 50),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an Account? ',
                      style: GoogleFonts.openSans(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.openSans(
                          fontSize: 20,
                          color: Colors.lightBlueAccent,
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
    );
  }
}
