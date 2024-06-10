import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ulearning_2/common/service/storage_service.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyADbZpyTDwEIQ64zv7U6yPrqejPWiC7vzA",
          appId: "1:555930874236:android:31a768058301955569b4f9",
          messagingSenderId: "555930874236",
          projectId: "ulearning-app-49354",
        )
    );
    storageService = await StorageService().init();
  }
}