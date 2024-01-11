import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BukusejarahPage extends StatefulWidget {
  const BukusejarahPage({Key? key}) : super(key: key);

  @override
  _BukusejarahPageState createState() => _BukusejarahPageState();
}

class _BukusejarahPageState extends State<BukusejarahPage> {
  List<Map<String, dynamic>> sejarahBooks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('https://openlibrary.org/subjects/history.json?limit=5'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          sejarahBooks = List<Map<String, dynamic>>.from(jsonData['works']);
          isLoading = false;
        });
      } else {
        print(
            'Failed to load history book data. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        setState(() {
          isLoading = false;
        });
        // Show an error message on the UI
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load history book data'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
      // Show an error message on the UI
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error fetching data. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular History Books'),
        backgroundColor: Colors.green, // Set your desired color
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : sejarahBooks.isEmpty
              ? Center(child: Text('No history books found.'))
              : ListView.builder(
                  itemCount: sejarahBooks.length,
                  itemBuilder: (context, index) {
                    final book = sejarahBooks[index];
                    return Card(
                      elevation: 3,
                      child: ListTile(
                        title: Text(
                          'Title: ${book['title']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Author: ${book['authors']?.join(', ') ?? "Unknown"}',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        // Add other relevant details as needed
                      ),
                    );
                  },
                ),
    );
  }
}
