import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  List<Map<String, dynamic>> schoolRanking = [];

  @override
  void initState() {
    super.initState();
    _fetchSchoolRanking();
  }

  void _fetchSchoolRanking() {
    Map<String, List<Map<String, dynamic>>> schoolUsersMap = {};

    // ユーザーデータを志望校ごとにグループ化
    userData.forEach((user) {
      String school = user['school'];
      if (!schoolUsersMap.containsKey(school)) {
        schoolUsersMap[school] = [];
      }
      schoolUsersMap[school]!.add(user);
    });

    // 各学校ごとにユーザーの成績をソート
    schoolUsersMap.forEach((school, users) {
      users.sort(
          (a, b) => b['percentage'].compareTo(a['percentage'])); // 高い順にソート
      setState(() {
        schoolRanking.add({'school': school, 'users': users});
      });
    });

    // 学校ごとにソート（必要なら）
    schoolRanking.sort((a, b) => a['school'].compareTo(b['school']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('志望校ランキング',
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Color.fromARGB(255, 3, 240, 244),
      body: schoolRanking.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: schoolRanking.length,
              itemBuilder: (context, index) {
                final schoolData = schoolRanking[index];
                return Card(
                  margin: EdgeInsets.all(10.0),
                  elevation: 5.0,
                  child: ExpansionTile(
                    title: Center(
                      child: Text(
                        '${schoolData['school']}',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    children: <Widget>[
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: schoolData['users'].length,
                        itemBuilder: (context, userIndex) {
                          final user = schoolData['users'][userIndex];
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text('${userIndex + 1}'),
                              backgroundColor: Colors.lightBlue,
                              foregroundColor: Colors.white,
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ユーザー: ${user['userName']}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '偏差値: ${user['percentage'].toStringAsFixed(1)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

// 例としてのユーザーデータ
List<Map<String, dynamic>> userData = [
  {
    'userName': '早稲田太郎',
    'school': '早稲田大学',
    'percentage': 70.0,
  },
  {
    'userName': '早稲田一郎',
    'school': '早稲田大学',
    'percentage': 65.0,
  },
  {
    'userName': '早稲田一郎',
    'school': '早稲田大学',
    'percentage': 68.0,
  },
  {
    'userName': '福沢次郎',
    'school': '慶応大学',
    'percentage': 75.0,
  },
  {
    'userName': '福沢治郎吉',
    'school': '慶応大学',
    'percentage': 60.0,
  },
  {
    'userName': 'ザビエル',
    'school': '上智大学',
    'percentage': 80.0,
  },
  {
    'userName': 'マルコポーロ',
    'school': '上智大学',
    'percentage': 78.0,
  },
];
