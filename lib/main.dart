import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        fontFamily: 'Raleway', // Set Raleway as the default font
        primaryColor: Color(0xFF2258A5), // Set primary color to blue for AppBar
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xFFEBE5FC)),
          bodyText2: TextStyle(color: Color(0xFFEBE5FC)),
        ),
      ),
      home: ProfileListPage(),
    );
  }
}

class ProfileListPage extends StatelessWidget {
  final List<Map<String, dynamic>> profiles = [
    {
      'name': 'Marcello Ezra Andilolo Lubis',
      'id': '5026221097',
      'description':
          'Lahir tidak nangis\nPernah ngerekam suara pas tidur, di rekamannya ada suara anak kecil ketawa',
      'imageUrl': 'https://www.its.ac.id/international/wp-content/uploads/sites/66/2024/03/Medfo-Vice-Coordinator-150x150.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2258A5),
      appBar: AppBar(
        title: Text('Profile List'),
        backgroundColor: Color(0xFF2258A5),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue.shade100,
            child: ListTile(
              leading: Image.network(
                profiles[index]['imageUrl'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                profiles[index]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(profiles[index]['id']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileDetailPage(profile: profiles[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProfileDetailPage extends StatelessWidget {
  final Map<String, dynamic> profile;

  ProfileDetailPage({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2258A5),
      appBar: AppBar(
        title: Text(profile['name']),
        backgroundColor: Color(0xFF2258A5),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                profile['imageUrl'],
                width: 100,
                height: 102,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 24),
              Text(
                profile['name'],
                style: TextStyle(
                  color: Color(0xFFEBE5FC),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                profile['id'],
                style: TextStyle(
                  color: Color(0xFFEBE5FC),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                profile['description'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFEBE5FC),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
