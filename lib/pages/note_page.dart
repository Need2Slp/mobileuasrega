import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileuasrega/pages/bukufiksi_page.dart';
import 'package:mobileuasrega/pages/bukukomik_page.dart';
import 'package:mobileuasrega/pages/bukusejarah_page.dart';
import 'package:mobileuasrega/services/firestore.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final FirestoreService firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();

  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (docID == null) {
                  firestoreService.addNote(textController.text);
                } else {
                  firestoreService.updateNote(docID, textController.text);
                }
                textController.clear();
                Navigator.pop(context);
              },
              child: Text('add'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Note'),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    'nama user',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Simple Note',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NotePage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text(
                  'Buku Fiksi',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BukufiksiPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text(
                  'Buku Sejarah',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BukusejarahPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text(
                  'Buku Komik',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BukukomikPage()));
                },
              ),
            ],
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List noteList = snapshot.data!.docs;
            return ListView.builder(
              itemCount: noteList.length,
              itemBuilder: (context, index) {
                DocumentSnapshot document = noteList[index];
                String docID = document.id;
                Map<String, dynamic> data =
                    document.data() as Map<String, dynamic>;
                String noteText = data['note'];

                return ListTile(
                  title: Text(noteText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => openNoteBox(docID: docID),
                        icon: const Icon(Icons.settings),
                      ),
                      IconButton(
                        onPressed: () => firestoreService.deleteNote(docID),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Text('No Note.....');
          }
        },
      ),
    );
  }
}
