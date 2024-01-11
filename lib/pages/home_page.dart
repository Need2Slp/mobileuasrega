import 'package:flutter/material.dart';
import 'package:mobileuasrega/pages/note_page.dart';

import 'bukufiksi_page.dart';
import 'bukukomik_page.dart';
import 'bukusejarah_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Genres'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Quick glimpses into a world of captivating stories',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              _buildGenreButton(
                context,
                'Buku-Buku Fiksi',
                'lib/assets/bukufiksi.png',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BukufiksiPage()),
                  );
                },
              ),
              SizedBox(height: 10),
              _buildGenreButton(
                context,
                'Buku-Buku Sejarah',
                'lib/assets/bukusejarah.png',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BukusejarahPage()),
                  );
                },
              ),
              SizedBox(height: 10),
              _buildGenreButton(
                context,
                'Buku-Buku Komik',
                'lib/assets/bukukomik.png',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BukukomikPage()),
                  );
                },
              ),
            ],
          ),
        ),
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
    );
  }

  Widget _buildGenreButton(
    BuildContext context,
    String buttonText,
    String imagePath,
    void Function() onPressed,
  ) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              buttonText,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
