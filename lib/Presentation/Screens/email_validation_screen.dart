import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:product_recommendation_app/Business%20Logic/user_cred_provider.dart';
import 'package:product_recommendation_app/Presentation/Screens/forgot_password_screen.dart';

class EmailValidationScreen extends StatefulWidget {
  @override
  _EmailValidationScreenState createState() => _EmailValidationScreenState();
}


class _EmailValidationScreenState extends State<EmailValidationScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserCredProvider userCredProvider = Provider.of<UserCredProvider>(context);
    userCredProvider.verifyEmail();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('A Verification text has been sent to your email.'),
            TextButton(
              child: Text('Not your email? Change email.'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
