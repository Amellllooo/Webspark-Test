import 'package:flutter/material.dart';
import 'preview_screen.dart';

class Result {
  final String text;

  Result(this.text);
}

List<Result> _results = [
  Result('(0.0) -> (1.1) -> (2.2)'),
  Result('(2.0) -> (1.1) -> (0.2)'),
];

class ResultListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result List Screen'),
      ),
      body: ListView.builder(
        itemCount: _results.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_results[index].text),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PreviewScreen(resultText: _results[index].text)),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
          ),
          child: Text(
            'Send results to server',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}




