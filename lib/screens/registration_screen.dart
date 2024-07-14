import 'package:flutter/material.dart';
import 'package:study_app/screens/statistics_screen.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String student = '';
  String school = '';
  double percentage = 0.0;
  int japaneseScore = 0;
  int mathScore = 0;
  int englishScore = 0;
  int scienceScore = 0;
  int socialStudiesScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('成績登録',
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: Color.fromARGB(255, 3, 240, 244),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    labelText: '氏名',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 3, 3, 242))),
                onChanged: (value) {
                  setState(() {
                    student = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '志望校',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 3, 3, 242))),
                onChanged: (value) {
                  setState(() {
                    school = value;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '偏差値',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 3, 3, 242))),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    percentage = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '国語の成績',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 3, 3, 242))),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    japaneseScore = int.tryParse(value) ?? 0;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '数学の成績',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 3, 3, 242))),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    mathScore = int.tryParse(value) ?? 0;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '英語の成績',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 3, 3, 242))),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    englishScore = int.tryParse(value) ?? 0;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '理科の成績',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 3, 3, 242))),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    scienceScore = int.tryParse(value) ?? 0;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: '社会の成績',
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 3, 3, 242))),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    socialStudiesScore = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  StatisticsScreen.userData.add({
                    'student': student,
                    'school': school,
                    'percentage': percentage,
                    'japaneseScore': japaneseScore,
                    'mathScore': mathScore,
                    'englishScore': englishScore,
                    'scienceScore': scienceScore,
                    'socialStudiesScore': socialStudiesScore,
                  });
                  Navigator.pushNamed(context, '/statistics');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue, // ボタンのテキスト色
                  padding: EdgeInsets.symmetric(
                      horizontal: 40, vertical: 16), // ボタンの内側の余白
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // ボタンの角を丸くする
                  ),
                  textStyle: TextStyle(
                    fontSize: 25, // テキストのサイズ
                    fontFamily: 'Roboto', // テキストのフォント
                    fontWeight: FontWeight.bold, // テキストの太さ
                  ),
                ),
                child: Text('登録する'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
