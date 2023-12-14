import 'package:flutter/material.dart';
import 'package:quiz_football/question.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  bool _isChoosen = true;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Football Quiz"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(questionList[_currentIndex].logo,
                height: 250, width: 200, fit: BoxFit.fill),
            const SizedBox(height: 60),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      TextButton(onPressed: _isChoosen ? () {
                        _showSnackBar(0, questionList[_currentIndex].correctAnswer);
                      } : null, child: Text(
                          questionList[_currentIndex].option1
                      )),
                      TextButton(onPressed: _isChoosen ? () {
                        _showSnackBar(1, questionList[_currentIndex].correctAnswer);
                      } : null, child: Text(
                          questionList[_currentIndex].option2
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      TextButton(onPressed: _isChoosen ? () {
                        _showSnackBar(2, questionList[_currentIndex].correctAnswer);
                      } : null, child: Text(
                          questionList[_currentIndex].option3
                      )),
                      TextButton(onPressed: _isChoosen ? () {
                        _showSnackBar(3, questionList[_currentIndex].correctAnswer);
                      } : null, child: Text(
                          questionList[_currentIndex].option4
                      )),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                if (_currentIndex < questionList.length - 1) {
                  setState(() {
                    _isChoosen = true;
                    _currentIndex++;
                  });
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text(_score.toString()),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    setState(() {
                                      questionList.shuffle();
                                      _currentIndex = 0;
                                      _isChoosen = true;
                                      _score = 0;
                                    });
                                  },
                                  child: Text("OK"))
                            ],
                          ));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white),
              child: Text(
                  _currentIndex == questionList.length - 1 ? "Finish" : "Next"),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
  void _showSnackBar(int index, int answer) {
    setState(() {
      _isChoosen = false;
    });
    if(index == answer) {
      _score++;
    }
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(index == answer ? "Correct" : "Incorrect"),
      backgroundColor: index == answer ? Colors.green : Colors.red)
    );
  }
}
