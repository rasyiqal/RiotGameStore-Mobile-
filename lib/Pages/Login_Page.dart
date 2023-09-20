import 'package:flutter/material.dart';
import 'package:mobile_ver/navigation/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool _isPasswordVisible = false;
bool _rememberMe = false;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            //constraints: const BoxConstraints(maxWidth: 350),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/riot_logo.png',
                    scale: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 120,
                      bottom: 32,
                    ),
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(
                      height: 0.7,
                    ),
                    validator: (value) {
                      // add email validation
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return 'Please enter a valid email';
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      //prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 238, 238, 238),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    style: TextStyle(
                      height: 0.7,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }

                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      //prefixIcon: const Icon(Icons.lock_outline_rounded),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 238, 238, 238),
                      suffixIcon: IconButton(
                        icon: Icon(_isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            right: 16,
                          ),
                          child: InkWell(
                            onTap: () {
                              print('tap tap');
                            },
                            child: Image.asset('assets/ic_facebook.png'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 16,
                          ),
                          child: InkWell(
                            onTap: () {
                              print('tap tap');
                            },
                            child: Image.asset('assets/ic_google.png'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 16,
                          ),
                          child: InkWell(
                            onTap: () {
                              print('tap tap');
                            },
                            child: Image.asset('assets/ic_mac.png'),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: 0,
                          ),
                          child: InkWell(
                            onTap: () {
                              print('tap tap');
                            },
                            child: Image.asset('assets/ic_xbox.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // CheckboxListTile(
                  //   value: _rememberMe,
                  //   onChanged: (value) {
                  //     if (value == null) return;
                  //     setState(() {
                  //       _rememberMe = value;
                  //     });
                  //   },
                  //   title: const Text('Remember me'),
                  //   controlAffinity: ListTileControlAffinity.leading,
                  //   dense: true,
                  //   contentPadding: const EdgeInsets.all(0),
                  // ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NavigationPage()), // Ganti YourHomePage dengan halaman awal Anda
                        (route) => false,
                      );
                    },
                    child: Image.asset('assets/arrow-square-right-button.png'),
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(4)),
                  //     ),
                  //     child: const Padding(
                  //       padding: EdgeInsets.all(10.0),
                  //       child: Text(
                  //         'Sign in',
                  //         style: TextStyle(
                  //             fontSize: 16, fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       if (_formKey.currentState?.validate() ?? false) {
                  //         /// do something
                  //       }
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 32),
                  Column(
                    children: [
                      Text('CAN’T SIGN IN?'),
                      SizedBox(
                        height: 8,
                      ),
                      Text('CREATE ACCOUNT'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
