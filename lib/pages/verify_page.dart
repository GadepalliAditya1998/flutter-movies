import 'package:flutter/material.dart';
import 'package:flutterMoviesApp/pages/home.dart';
import 'package:flutterMoviesApp/providers/login_provider.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:provider/provider.dart';

class VerifyPage extends StatelessWidget {
  const VerifyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verify')),
      body: Consumer<LoginProvider>(builder: (context, loginProvider, _) {
        if (loginProvider.authenticationState == AuthenticationState.verified) {
          this._navigateToHome(context);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OTPTextField(
                length: 6,
                onCompleted: loginProvider.verifyOTP,
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: this._getMessage(context)),
              if (loginProvider.authenticationState ==
                  AuthenticationState.timedOut)
                RaisedButton(
                    onPressed: loginProvider.verifyPhoneNumber,
                    child: Text('Resend OTP'))
            ],
          ),
        );
      }),
    );
  }

  Widget _getMessage(BuildContext context) {
    var loginProvider = Provider.of<LoginProvider>(context, listen: false);
    switch (loginProvider.authenticationState) {
      case AuthenticationState.progress:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20, width: 20, child: CircularProgressIndicator()),
            SizedBox(width: 10),
            Text('OTP will be sent to ${loginProvider.phoneNumber}'),
          ],
        );
      case AuthenticationState.verified:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 20,
                width: 20,
                child: Icon(Icons.verified, color: Colors.green)),
            SizedBox(width: 10),
            Text('Verified Successfully'),
          ],
        );
      case AuthenticationState.timedOut:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 20,
                width: 20,
                child: Icon(Icons.timer_outlined, color: Colors.redAccent)),
            SizedBox(width: 10),
            Text(
              'Verification timed out',
              style: TextStyle(color: Colors.redAccent),
            ),
          ],
        );
      default:
        return Container();
    }
  }

  void _navigateToHome(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()), (route) => false));
  }
}
