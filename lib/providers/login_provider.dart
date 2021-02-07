import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

enum AuthenticationState { notStarted, progress, verified, failed, timedOut }

class LoginProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  LoginProvider() {
    auth.authStateChanges().listen((user) {
      if (user != null)
        this.setAutheticationState(AuthenticationState.verified);
    });
  }

  bool _isAuthenticatedUser;
  AuthenticationState _authenticationState = AuthenticationState.notStarted;
  String _phoneNumber;

  int _token;
  String _verificationId;

  bool get isAuthenticated => this._isAuthenticatedUser;
  AuthenticationState get authenticationState => this._authenticationState;
  String get phoneNumber => this._phoneNumber;

  setAutheticationState(AuthenticationState state) {
    this._authenticationState = state;
    notifyListeners();
  }

  void setPhoneNumber(String phoneNumber) {
    this._phoneNumber = phoneNumber;
  }

  void verifyPhoneNumber() async {
    this._isAuthenticatedUser = false;

    await this.auth.verifyPhoneNumber(
          phoneNumber: this.phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {
            this._isAuthenticatedUser = true;
            this.setAutheticationState(AuthenticationState.verified);
          },
          verificationFailed: (FirebaseAuthException e) {
            this.setAutheticationState(AuthenticationState.failed);
          },
          codeSent: (String verificationId, int resendToken) {
            this._verificationId = verificationId;
            this._token = resendToken;
            this.setAutheticationState(AuthenticationState.progress);
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            this.setAutheticationState(AuthenticationState.timedOut);
          },
          timeout: Duration(seconds: 30),
          forceResendingToken: this._token,
        );
  }

  void verifyOTP(String otp) async {
    var credential = PhoneAuthProvider.credential(
        verificationId: this._verificationId, smsCode: otp);
    var userCredential = await this.auth.signInWithCredential(credential);
    this.setAutheticationState(userCredential != null
        ? AuthenticationState.verified
        : AuthenticationState.failed);
  }
}
