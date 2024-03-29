import 'package:flutter/material.dart';
import 'process_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _urlController;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController();
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  void _startButtonPressed() {
    final url = _urlController.text.trim();
    if (_isValidUrl(url)) {
      // Proceed with URL processing
      print('Valid URL: $url');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProcessScreen()),
      );
    } else {
      // Display error message for invalid URL
      setState(() {
        _errorMessage = 'Invalid URL format';
      });
    }
  }

  bool _isValidUrl(String url) {
    return Uri.tryParse(url)?.isAbsolute ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _urlController,
              decoration: InputDecoration(
                labelText: 'Enter API URL',
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _startButtonPressed,
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              textStyle: TextStyle(fontSize: 24, color: Colors.black),
            ),
            child: Text('Start'),
          ),
        ],
      ),
    );
  }
}