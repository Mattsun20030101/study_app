import 'package:flutter/material.dart';
import 'package:study_app/screens/statistics_screen.dart';

class UserListScreen extends StatelessWidget {
  final List<String> users = ['早稲田太郎', 'ザビエル', 'マルコポーロ'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ユーザーリスト',
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Color.fromARGB(255, 3, 240, 244),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            elevation: 5.0,
            child: ListTile(
              title: Center(
                child: Text(
                  users[index],
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 3, 3, 242)),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/chat', arguments: users[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
