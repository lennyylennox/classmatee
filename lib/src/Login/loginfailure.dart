class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred."]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
            'Email does not correspond to an existing account');
      case 'operation-not-allowed':
        return const LogInWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support for help');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help.');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
