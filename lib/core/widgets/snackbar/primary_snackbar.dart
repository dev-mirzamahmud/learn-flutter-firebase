import 'package:flutter/material.dart';
import 'package:learn_flutter_firebase/core/enums/snackbar_type.dart';
import 'package:learn_flutter_firebase/core/helper/extensions/snackbar_extensions.dart';

class PrimarySnackbar {
  static SnackBar show(String msg, {required SnackbarType type}) {
    return SnackBar(
      backgroundColor: type.toBgColor,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          type.toIcon,
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  type.toSnackbarLabel,
                  style: TextStyle(
                    color: type.toFgColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  msg,
                  style: TextStyle(
                    color: type.toFgColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
