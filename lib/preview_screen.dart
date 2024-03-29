import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  final String resultText;

  PreviewScreen({Key? key, required this.resultText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview Screen'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return GridTile(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: _getCellColor(index),
              ),
              child: Center(
                child: Text(
                  '(${index ~/ 3}.${index % 3})',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getCellColor(int index) {
    int row = index ~/ 3;
    int column = index % 3;

    if (resultText.contains('($row.$column)')) {
      if (row == 0 && column == 0) {
        return const Color(0xFF64FFDA); // Початкова клітинка
      } else if (row == 1 && column == 1) {
        return const Color(0xFF4CAF50); // Клітинка найкоротшого шляху
      } else if (row == 2 && column == 2) {
        return const Color(0xFF009688); // Кінцева клітинка
      } else if (resultText.contains('(2.0)') && row == 2 && column == 0) {
        return const Color(0xFF64FFDA); // Початкова клітинка для другого варіанту
      } else if (resultText.contains('(0.2)') && row == 0 && column == 2) {
        return const Color(0xFF009688); // Кінцева клітинка для другого варіанту
      }
    }

    return Colors.white; // Порожня клітинка
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                runApp(MaterialApp(
                  home: PreviewScreen(resultText: '0.0 - 1.1 - 2.3'),
                ));
              },
              child: Text('Show First Variant'),
            ),
            ElevatedButton(
              onPressed: () {
                runApp(MaterialApp(
                  home: PreviewScreen(resultText: '2.0 - 1.1 - 0.2'),
                ));
              },
              child: Text('Show Second Variant'),
            ),
          ],
        ),
      ),
    ),
  ));
}

