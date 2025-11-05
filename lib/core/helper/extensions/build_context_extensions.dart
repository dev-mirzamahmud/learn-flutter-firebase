import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
}
