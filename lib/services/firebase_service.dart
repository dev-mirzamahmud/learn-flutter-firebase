import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_firebase/core/errors/firebase_error_handler.dart';
import 'package:learn_flutter_firebase/core/utils/result.dart';
import 'package:learn_flutter_firebase/firebase_options.dart';

class FirebaseService {
  FirebaseService._internal();

  static final FirebaseService instance = FirebaseService._internal();

  factory FirebaseService() => instance;

  late final FirebaseAuth _auth;
  late final FirebaseFirestore _firestore;
  late final FirebaseStorage _storage;

  BuildContext? _context;

  bool _isInitialize = false;

  // Firebase -> Initialize
  Future<void> initializeFirebase() async {
    if (_isInitialize) return;

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;
    _storage = FirebaseStorage.instance;

    _isInitialize = true;
  }

  // ====================================================================================================================
  // Firebase Auth
  // ====================================================================================================================

  /// Firebase Sign In -> Using Email and Password
  Future<Result<UserCredential>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Success(user);
    } catch (error) {
      return Failure(FirebaseErrorHandler.errorHandler(error));
    }
  }

  /// Firebase Sign Up -> Using Email and Password
  Future<Result<UserCredential>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Success(user);
    } catch (error) {
      return Failure(FirebaseErrorHandler.errorHandler(error));
    }
  }

  Future<Result<void>> signOut() async {
    try {
      await _auth.signOut();
      return const Success(null);
    } catch (error) {
      return Failure(FirebaseErrorHandler.errorHandler(error));
    }
  }

  User? get currentUser => _auth.currentUser;
  bool get isLoggedIn => _auth.currentUser != null;

  // ============================================================================================================
  // Firebase Firestore
  // ============================================================================================================

  Future<Result<DocumentReference>> addData({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      final document = await _firestore.collection(collection).add(data);
      return Success(document);
    } catch (error) {
      return Failure(FirebaseErrorHandler.errorHandler(error));
    }
  }
}
