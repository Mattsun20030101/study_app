import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  static List<Map<String, dynamic>> userData = []; // ユーザーデータを保存するリスト

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登録された成績の統計',
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Color.fromARGB(255, 3, 240, 244),
      body: userData.isEmpty
          ? Center(child: Text('データがありません'))
          : ListView.builder(
              itemCount: userData.length,
              itemBuilder: (context, index) {
                final data = userData[index];
                return Card(
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '氏名: ${data['student']}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                '志望校: ${data['school']}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                '偏差値: ${data['percentage']}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '国語: ${data['japaneseScore']}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  '数学: ${data['mathScore']}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '英語: ${data['englishScore']}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  '理科: ${data['scienceScore']}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '社会: ${data['socialStudiesScore']}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
