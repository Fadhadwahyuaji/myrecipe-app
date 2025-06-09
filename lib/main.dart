import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myrecipe_app/providers/auth_provider.dart';
import 'package:myrecipe_app/providers/kategori_provider.dart';
import 'package:myrecipe_app/providers/resep_provider.dart';
import 'package:myrecipe_app/screens/home_screen.dart';
import 'package:myrecipe_app/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ResepProvider()),
        ChangeNotifierProvider(create: (_) => KategoriProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Resep App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade200),
          useMaterial3: true,
        ),
        home: SharedPrefs.isLoggedIn ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
