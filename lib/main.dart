import 'package:carrot_market/firebase_options.dart';
import 'package:carrot_market/src/splash/controller/splash_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '당근마켓 클론',
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Color(0xff212123),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: const Color(0xff212123),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
      getPages: [GetPage(name: '/', page: () => const App())],
    );
  }
}
