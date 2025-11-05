import 'package:learn_flutter_firebase/services/firebase_service.dart';

class AppConfig {
  AppConfig._internal();

  static final AppConfig instance = AppConfig._internal();

  factory AppConfig() => instance;

  late final FirebaseService _firebaseService;

  bool _isInitialize = false;

  Future<void> initializeApp() async {
    if (_isInitialize) return;

    _firebaseService = FirebaseService.instance;

    await _firebaseService.initializeFirebase();

    _isInitialize = true;
  }
}
