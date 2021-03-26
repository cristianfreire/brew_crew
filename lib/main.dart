import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    home: new ScreenSplash(),
  ));
}

class ScreenSplash extends StatefulWidget {
  @override
  _ScreenSplashState createState() => new _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 5,
      navigateAfterSeconds: new _MyApp(),
      title: new Text(
        'Welcome to Brew Crew',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: new Image.network(
          'https://cdn-0.imagensemoldes.com.br/wp-content/uploads/2020/09/Desenho-de-Coffe-PNG-1017x1024.png'),
      backgroundColor: Colors.brown[100],
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.00,
      loaderColor: Colors.pink,
    );
  }
}

class _MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
