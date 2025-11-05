class FirebaseErrorHandler {
  static String errorHandler(Object error) {
    final message = error.toString();

    if (message.contains('permission-denied')) {
      return 'You don’t have permission to perform this action.';
    } else if (message.contains('network-request-failed')) {
      return 'Network error. Please check your internet connection.';
    } else if (message.contains('user-not-found')) {
      return 'No user found with this credential.';
    } else if (message.contains('email-already-in-use')) {
      return 'This email is already registered.';
    } else if (message.contains('wrong-password')) {
      return 'Invalid password.';
    } else if (message.contains('object-not-found')) {
      return 'The requested file was not found.';
    } else {
      return 'An unexpected error occurred. Please try again.';
    }
  }
}
