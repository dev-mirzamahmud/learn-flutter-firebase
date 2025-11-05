import 'package:flutter/material.dart';
import 'package:learn_flutter_firebase/core/enums/snackbar_type.dart';
import 'package:learn_flutter_firebase/core/helper/extensions/build_context_extensions.dart';
import 'package:learn_flutter_firebase/core/widgets/snackbar/primary_snackbar.dart';

class SnackbarUtils {
  static void success(BuildContext context, {required String msg}) {
    context.scaffoldMessenger.showSnackBar(
      PrimarySnackbar.show(msg, type: SnackbarType.SUCCESS),
    );
  }

  static void error(BuildContext context, {required String msg}) {
    context.scaffoldMessenger.showSnackBar(
      PrimarySnackbar.show(msg, type: SnackbarType.ERROR),
    );
  }

  static void warning(BuildContext context, {required String msg}) {
    context.scaffoldMessenger.showSnackBar(
      PrimarySnackbar.show(msg, type: SnackbarType.WARNING),
    );
  }

  static void restricted(BuildContext context, {required String msg}) {
    context.scaffoldMessenger.showSnackBar(
      PrimarySnackbar.show(msg, type: SnackbarType.RESTRICTED),
    );
  }
}
