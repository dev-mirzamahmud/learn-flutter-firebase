import 'package:flutter/material.dart';
import 'package:learn_flutter_firebase/core/config/app_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppConfig.instance.initializeApp();
}
