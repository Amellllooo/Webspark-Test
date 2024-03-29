import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'result_list_screen.dart';

class ProcessScreen extends StatefulWidget {
  @override
  _ProcessScreenState createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  bool _isLoading = false;

  Future<void> _sendResultsToServer() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate sending results to server
    await Future.delayed(Duration(seconds: 2));

    // Assuming successful submission
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ResultListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Process Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading)
              Column(
                children: [
                  SizedBox(
                    height: 32.0,
                    width: 32.0,
                    child: CircularProgressIndicator(strokeWidth: 6.0),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'All calculations has finished, you can send your result to server',
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '100%',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: _sendResultsToServer,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Send results to server',
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

