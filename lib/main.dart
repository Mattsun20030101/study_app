import 'package:flutter/material.dart';
import 'package:study_app/screens/home_screen.dart';
import 'package:study_app/screens/registration_screen.dart';
import 'package:study_app/screens/ranking_screen.dart';
import 'package:study_app/screens/chat_screen.dart';
import 'package:study_app/screens/statistics_screen.dart';
import 'package:study_app/screens/user_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "学習アプリ",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/', // initialRouteを設定
      routes: {
        '/': (context) => HomeScreen(), // デフォルトルートを設定
        '/registration': (context) => RegistrationScreen(),
        '/ranking': (context) => RankingScreen(),
        '/statistics': (context) => StatisticsScreen(),
        '/userList': (context) => UserListScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/chat') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ChatScreen(userName: args),
          );
        }
        return null;
      },
    );
  }
}
