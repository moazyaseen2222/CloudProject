import 'package:flutter/material.dart';

import 'signUp_1.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.green.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 80.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'البريد الالكتروني',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'كلمة المرور',
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.green.shade400,
                  child: MaterialButton(
                    onPressed: () {

                    },
                    child: const Text(
                      'تسجيل الدخول',

                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'ليس لديك حساب؟',
                    ),
                    TextButton(
                      onPressed: () {
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()),
                            );
                      },
                      child: Text(
                        'تسجيل جديد',
                        style: TextStyle( color: Colors.green.shade400,),
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
