import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Welcome to TOEFL® Test Pro',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          // Ikon crown untuk AppBar
          IconButton(
            icon: Icon(Icons.emoji_events, color: Colors.orange),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.calendar_today, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Prep Smart, Enjoy Learning, Reach Goal!',
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'TOEFL Practice',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              // Kartu untuk Listening
              PracticeCard(
                icon: Icons.headphones,
                title: 'Listening',
                subtitle: '500+ Questions',
                iconColor: Colors.blue,
              ),
              // Kartu untuk Reading
              PracticeCard(
                icon: Icons.book,
                title: 'Reading',
                subtitle: '400+ Questions',
                iconColor: Colors.red,
              ),
              // Kartu untuk Speaking
              PracticeCard(
                icon: Icons.speaker,
                title: 'Speaking',
                subtitle: '50+ Topics',
                iconColor: Colors.yellow,
              ),
              // Kartu untuk Writing
              PracticeCard(
                icon: Icons.edit,
                title: 'Writing',
                subtitle: '100+ Samples',
                iconColor: Colors.orange,
              ),
              SizedBox(height: 20),
              Text(
                'TOEFL Prep',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              // Kartu untuk Vocabulary dan Grammar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrepCard(
                    icon: Icons.spellcheck,
                    title: 'Vocabulary',
                    subtitle: '2000+ Words',
                  ),
                  PrepCard(
                    icon: Icons.article,
                    title: 'Grammar',
                    subtitle: '2000+ Questions',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      // BottomNavigationBar untuk navigasi
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.orange),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews, color: Colors.blueGrey),
            label: 'Review',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.blueGrey),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}

// Widget kustom untuk kartu praktek TOEFL
class PracticeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  PracticeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.orange),
      ),
    );
  }
}

// Widget kustom untuk kartu persiapan TOEFL
class PrepCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  PrepCard({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3,
      child: Container(
        width: 150,
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.orange),
            SizedBox(height: 10),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}
