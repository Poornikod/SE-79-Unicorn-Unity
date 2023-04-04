class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure({this.message = "An Unknown Error Occurred"});

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case "email-already-in-use":
        return SignUpWithEmailAndPasswordFailure(message: "The email address is already in use by another account.");
      case "invalid-email":
        return SignUpWithEmailAndPasswordFailure(message: "The email address is badly formatted.");
      case "operation-not-allowed":
        return SignUpWithEmailAndPasswordFailure(message: "Password sign-in is disabled for this project.");
      case "weak-password":
        return SignUpWithEmailAndPasswordFailure(message: "The password is too weak.");
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}