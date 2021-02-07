import 'package:flutter/material.dart';
import 'package:flutterMoviesApp/pages/home.dart';
import 'package:flutterMoviesApp/pages/verify_page.dart';
import 'package:flutterMoviesApp/providers/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  SmsAutoFill _autoFill;
  TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    this._phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, loginProvider, _) {
      if (loginProvider.authenticationState == AuthenticationState.progress) {
        this._navigateToVerifyPage();
      } else if (loginProvider.authenticationState ==
          AuthenticationState.verified) {
        this._navigateToHome();
      }
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.movie_outlined, size: 70),
              SizedBox(height: 20),
              Container(
                width: 350,
                child: TextFormField(
                  controller: this._phoneNumberController,
                  onChanged: loginProvider.setPhoneNumber,
                  decoration: InputDecoration(
                      hintText: 'Enter Phone number',
                      suffixIcon: Tooltip(
                        message: 'Auto Detect',
                        child: IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () async {
                            this._phoneNumberController.text =
                                await this._autoFill.hint;
                            loginProvider.setPhoneNumber(
                                this._phoneNumberController.text);
                          },
                        ),
                      )),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Theme.of(context).primaryColor,
                onPressed: loginProvider.verifyPhoneNumber,
                child: loginProvider.authenticationState !=
                        AuthenticationState.progress
                    ? Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      )
                    : Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
              )
            ],
          ),
        ),
      );
    });
  }

  void _navigateToVerifyPage() {
    WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (context) => VerifyPage(), fullscreenDialog: true)));
  }

  void _navigateToHome() {
    WidgetsBinding.instance.addPostFrameCallback((_) => Navigator.of(context)
        .pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => Home()), (_) => false));
  }
}
