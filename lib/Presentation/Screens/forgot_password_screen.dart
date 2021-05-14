import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Enter your Email/Phone Number'),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Email Id',
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {

              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
