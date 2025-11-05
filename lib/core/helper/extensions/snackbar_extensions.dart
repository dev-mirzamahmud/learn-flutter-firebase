import 'package:flutter/material.dart';
import 'package:learn_flutter_firebase/core/enums/snackbar_type.dart';

extension SnackbarExtensions on SnackbarType {
  String get toSnackbarLabel {
    switch (this) {
      case SnackbarType.SUCCESS:
        return 'Success!';
      case SnackbarType.ERROR:
        return 'Error!';
      case SnackbarType.WARNING:
        return 'Warning!';
      case SnackbarType.RESTRICTED:
        return 'Restricted!';
    }
  }

  Color get toBgColor {
    switch (this) {
      case SnackbarType.SUCCESS:
        return Colors.green;
      case SnackbarType.ERROR:
        return Colors.red;
      case SnackbarType.WARNING:
        return Colors.orangeAccent;
      case SnackbarType.RESTRICTED:
        return Colors.blue;
    }
  }

  Color get toFgColor {
    switch (this) {
      case SnackbarType.SUCCESS:
      case SnackbarType.ERROR:
      case SnackbarType.RESTRICTED:
        return Colors.white;
      case SnackbarType.WARNING:
        return Colors.black;
    }
  }

  Icon get toIcon {
    switch (this) {
      case SnackbarType.SUCCESS:
        return Icon(
          Icons.check_circle_outline_rounded,
          color: toFgColor,
          size: 20,
        );
      case SnackbarType.ERROR:
        return Icon(Icons.error_outline_rounded, color: toFgColor, size: 20);
      case SnackbarType.WARNING:
        return Icon(Icons.warning_amber_outlined, color: toFgColor, size: 20);
      case SnackbarType.RESTRICTED:
        return Icon(Icons.question_mark_outlined, color: toFgColor, size: 20);
    }
  }
}
