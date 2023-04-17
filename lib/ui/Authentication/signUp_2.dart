import 'package:flutter/material.dart';
import 'package:palliative_care/Model/userModel.dart';

import '../../Firebase/auth_firebase.dart';

class SignUp_2 extends StatefulWidget {
  @override
  State<SignUp_2> createState() => _SignUp_2State();
}

class _SignUp_2State extends State<SignUp_2> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confPassword = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool _showPassword = true;
  bool _showPassword2 = true;


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confPassword.dispose();
  }


  @override
  Widget build(BuildContext context) {
    List<String>? _data2 = ModalRoute.of(context)!.settings.arguments as List<String>?;
    print(_data2![0]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade400,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: _emailController,
                    onFieldSubmitted: (String value) {},
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: const Icon(
                        Icons.email,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty ) {
                        return 'please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _showPassword2,
                    onFieldSubmitted: (String value) {},
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon:  const Icon( Icons.lock,),

                      suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _showPassword2 = !_showPassword2;
                          });

                        },
                        icon: Icon(
                         _showPassword2 ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty && _confPassword.text.isEmpty && _confPassword.text == value ) {
                        return 'please enter your password and confirm it';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _confPassword,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _showPassword,
                    onFieldSubmitted: (String value) {},
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        onPressed: (){
                          _showPassword = !_showPassword;
                          setState(() {

                          });
                        },
                        icon: Icon(
                          _showPassword ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty ) {
                        return 'please enter your password and confirm it';
                      }else if(value != _passwordController.text){
                        return 'password not match';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff66CA98),
                      minimumSize: const Size(200, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: () async{
                      if(formKey.currentState!.validate() ) {
                    bool isDon =    await  FbAuthController().createAccount(context, email: _emailController.text, password: _passwordController.text);

                    if (isDon){
                     //  FbAuthController().getUid;
                       print(FbAuthController().getUid);
                      UserModel userModel = UserModel(id: FbAuthController().getUid, name: '${_data2[0]} ${_data2[1]} ${_data2[2]}', email: _emailController.text, image: 'null', phone: _data2[3], address: _data2[4], birthDate:_data2[5] ,interest: "programming",notification: true );

                      await FbAuthController().saveUser(userModel);

                    }
                      }

                    },
                    child:const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),),
                  const SizedBox(
                    height: 10.0,
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
