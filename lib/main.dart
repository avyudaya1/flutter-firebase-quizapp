import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/home/home.dart';
import 'package:foodapp/shared/loading.dart';
import 'package:foodapp/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {}

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Food App',
            home: HomeScreen(),
            theme: appTheme,
          );
        }

        return MaterialApp(
          title: 'Food App',
          home: LoadingScreen(),
          theme: appTheme,
        );
      },
    );
  }
}
