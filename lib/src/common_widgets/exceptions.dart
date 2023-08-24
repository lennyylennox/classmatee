class TExceptions implements Exception {
  // -- The linked error message;
  final String message;

  const TExceptions([this.message = "An unknown exception occurred"]);

  // -- Create authentication message
  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('Email already in use');
      case 'weak-password':
        return const TExceptions('Please enter a strong password.');
      case 'invalid-email':
        return const TExceptions('Email is not valid or badly formatted');
      case 'operation-not-allowed':
        return const TExceptions(
            'Operation is not allowed. Please contact support for help');
      case 'user-disabled':
        return const TExceptions(
            'This user has been disabled. Please contact support for help.');
      case 'user-not-found':
        return const TExceptions('Invalid details, please create an account');
      case 'wrong-password':
        return const TExceptions('Incorrect password, please try again');
      case 'too-many-requests':
        return const TExceptions(
            'Too many requests, Service Temporarily blocked');
      case 'session-cookie-expired':
        return const TExceptions(
            'The provided Firebase session cookie is expired');
      case 'invalid-argument':
        return const TExceptions(
            'An invlaid argument was provided to an authentication method');
      case 'invalid-password':
        return const TExceptions('Incorrect password, please try again');
      case 'uid-already-exists':
        return const TExceptions(
            'The provided uid is already in use by an existing user');
      default:
        return const TExceptions();
    }
  }
}
