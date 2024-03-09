import 'dart:convert';
import 'package:assignment/modules/dashboard/views/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';

final dio = Dio();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool errorWidget = false;

  final _formKey = GlobalKey<FormState>();

  String emailAddress = "";
  String password = "";

  bool userInteracts() => emailAddress != null && password != null;

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  Color emailBorderColor = Colors.blueGrey.shade100;

  bool userGivenInput = false;

  @override
  Widget build(BuildContext context) {
    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isEmpty || !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                right: 13.0, top: 17, left: 12, bottom: 17),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              //check for validation while typing
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'example',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 100,
                    height: 30,
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Hi, Welcome Back!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900]),
                  ),
                  const SizedBox(height: 35),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "     Please Sign in to continue",
                        style: TextStyle(color: Colors.indigo),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9@a-zA-Z.]")),
                            ],
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Enter Email or Mob No.',
                              hintStyle:
                                  const TextStyle(fontWeight: FontWeight.w400),
                            ),
                            validator: validateEmail,
                            onChanged: (value) {
                              setState(() {
                                emailAddress = value;
                              });
                            }),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        "                                                       Sign In With OTP",
                        style: TextStyle(
                            color: Colors.indigoAccent[700],
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "  Password",
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          obscureText: false,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            hintStyle:
                                const TextStyle(fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (password != null &&
                                (value == null || value.isEmpty)) {
                              return 'Please enter the password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                                value: false,
                                side: const BorderSide(
                                    color: Colors.blueGrey, width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                onChanged: (bool? selected) {}),
                            const Text(
                              "Remember Me",
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                            Text(
                              "              Forgot Password",
                              style: TextStyle(
                                  color: Colors.indigoAccent[700],
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: errorWidget,
                    child: const Text(
                      "Wrong password",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: SizedBox(
                      height: 50,
                      width: 336,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigoAccent,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    color: Colors.indigoAccent, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              )),
                          onPressed: !userInteracts() ||
                                  _formKey.currentState == null ||
                                  !_formKey.currentState!.validate()
                              ? null
                              : () async {
                                  login(emailAddress, password)
                                      .then((response) => null)
                                      .catchError((e) {
                                    invalidAlert(context);
                                  });
                                },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.5 // Set the text color
                                ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(children: <Widget>[
                    Expanded(child: Divider()),
                    Text("or"),
                    Expanded(child: Divider()),
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(
                              height: 50,
                              // width: 35,
                              child: SignInButton(
                                button: Button.Google,
                                small: true,
                                iconSize: 40,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              // width: 35,
                              child: SignInButton(
                                button: Button.LinkedIn,
                                small: true,
                                iconSize: 10,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              // width: 35,
                              child: SignInButton(
                                button: Button.Facebook,
                                small: true,
                                iconSize: 40,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              // width: 35,
                              child: SignInButton(
                                button: Button.InstagramGradient,
                                small: true,
                                iconSize: 40,
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              // width: 35,
                              child: SignInButton(
                                button: Button.PlayStation,
                                small: true,
                                iconSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Business User?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey),
                      ),
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.blueGrey),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Login Here",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.indigoAccent),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.indigoAccent),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "By continuing, you agree to",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Example's ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                      Text(
                        "Terms of Use & Privacy Policy.",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 13),
                      ),
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

  Future<String> login(String emailId, String passworded) async {
    sha256.convert(utf8.encode(passworded)).toString();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DashboardPage()));

    return "success";
  }

  void invalidAlert(BuildContext context) {
    final alert = AlertDialog(
      title: const Text("Error"),
      content: const Text("Invalid emailId or password."),
      actions: [
        TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
