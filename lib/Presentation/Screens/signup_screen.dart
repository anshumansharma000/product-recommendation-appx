import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {

  bool _showPassword = true;

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              //Input name
              decoration: InputDecoration(hintText: 'Name'),
            ),
            TextFormField(
              //Input email
              decoration: InputDecoration(
                hintText: 'Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              //Input password
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      widget._showPassword = !widget._showPassword;
                    });
                  },
                ),
              ),
              obscureText: widget._showPassword,
            ),
            TextFormField(
              //Input password
              decoration: InputDecoration(hintText: 'Confirm Password'),
              obscureText: widget._showPassword,
            ),
            MaterialButton(child: Text('Sign Up'), onPressed: () {

            }),
          ],
        ),
      ),
    );
  }
}
