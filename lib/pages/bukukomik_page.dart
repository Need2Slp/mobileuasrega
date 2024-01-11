import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BukukomikPage extends StatefulWidget {
  const BukukomikPage({Key? key}) : super(key: key);

  @override
  _BukukomikPageState createState() => _BukukomikPageState();
}

class _BukukomikPageState extends State<BukukomikPage> {
  List<Map<String, dynamic>> komikBooks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
          Uri.parse('https://openlibrary.org/subjects/comics.json?limit=5'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        setState(() {
          komikBooks = List<Map<String, dynamic>>.from(jsonData['works']);
          isLoading = false;
        });
      } else {
        print(
            'Failed to load comic book data. Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        setState(() {
          isLoading = false;
        });
        // Show an error message on the UI
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load comic book data'),
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
        title: Text('Popular Comic Books'),
        backgroundColor: Colors.orange, // Set your desired color
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : komikBooks.isEmpty
              ? Center(child: Text('No comic books found.'))
              : ListView.builder(
                  itemCount: komikBooks.length,
                  itemBuilder: (context, index) {
                    final book = komikBooks[index];
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
