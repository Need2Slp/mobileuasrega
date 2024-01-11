import 'package:flutter/material.dart';
import 'package:mobileuasrega/pages/bukufiksi_page.dart';
import 'package:mobileuasrega/pages/bukukomik_page.dart';
import 'package:mobileuasrega/pages/bukusejarah_page.dart';
import 'package:mobileuasrega/pages/login_page.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Genres Explanation'),
        backgroundColor: Colors.blue, // Set your desired color
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue,
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    'regafhm@gmail.com',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
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
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Log Out',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          _buildGenreItem(
            'Fiction',
            'Fiksi adalah sebuah genre yang mencakup cerita imajinatif atau rekaan. Buku fiksi memungkinkan pembaca untuk menjelajahi dunia, karakter, dan peristiwa imajiner. Buku fiksi sering kali mencerminkan kreativitas dan keterampilan bercerita dari para penulisnya.',
            'lib/assets/bukufiksi.png', // Replace with your image asset path
          ),
          _buildGenreItem(
            'History',
            'Buku-buku sejarah memberikan kisah tentang peristiwa, peradaban, dan budaya masa lalu. Buku-buku ini memungkinkan pembaca untuk belajar tentang pencapaian, tantangan, dan momen-momen penting yang telah membentuk dunia yang kita tinggali saat ini.',
            'lib/assets/bukusejarah.png', // Replace with your image asset path
          ),
          _buildGenreItem(
            'Comics',
            'Komik menggabungkan seni visual dan penceritaan. Komik menggunakan kombinasi gambar dan teks untuk menyampaikan narasi. Komik dikenal dengan formatnya yang menarik dan dinamis, menjadikannya bentuk penceritaan yang unik dan populer.',
            'lib/assets/bukukomik.png', // Replace with your image asset path
          ),
        ],
      ),
    );
  }

  Widget _buildGenreItem(String title, String description, String imagePath) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                imagePath,
                height: 150, // Set your desired image height
                width: 150, // Set your desired image width
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
