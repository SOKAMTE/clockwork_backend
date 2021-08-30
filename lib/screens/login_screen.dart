import 'package:clockwork_backend/services/auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter valid email";
                    }

                    return null;
                  }),
              TextFormField(
                  controller: _passwordController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Please enter password";
                    }

                    return null;
                  }),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                  minWidth: double.infinity,
                  color: Colors.blue,
                  onPressed: () {
                    Map creds = {
                      'email': _emailController.text,
                      'password': _passwordController.text,
                      'device_name': 'mobile',
                    };
                    if (_formKey.currentState!.validate()) {
                      //print(_emailController.text);
                      Provider.of<Auth>(context, listen: false).login(creds);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          )),
    ));
  }
}
