import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.person),
              SizedBox(width: 10),
              Text('About Me'),
            ],
          ),
          backgroundColor: Colors.deepPurple.withOpacity(0.6),
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mohammad Yahfoufi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Coding captivated me in school, driving me to major in computer science. At university, I mastered mobile, web, and game development. My journey is all about innovation and perpetual learning.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  TabBar(
                    tabs: [
                      Tab(text: 'Languages'),
                      Tab(text: 'Skills'),
                    ],
                    indicatorColor: Colors.purple,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildLanguagesTab(),
                        _buildSkillsTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguagesTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSkillBar('Java', 0.9),
          _buildSkillBar('Dart', 0.8),
          _buildSkillBar('C#', 0.8),
          _buildSkillBar('HTML', 0.8),
          _buildSkillBar('CSS', 0.8),
          _buildSkillBar('Kotlin', 0.7),
          _buildSkillBar('PHP', 0.7),
          _buildSkillBar('Python', 0.7),
          _buildSkillBar('JavaScript', 0.6),
        ],
      ),
    );
  }

  Widget _buildSkillsTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSkillBar('Mobile Development', 0.9),
          _buildSkillBar('Game Development', 0.9),
          _buildSkillBar('Web Development', 0.8),
          _buildSkillBar('Firebase', 0.8),
          _buildSkillBar('Backend', 0.7),
          _buildSkillBar('Cyber Security', 0.6),
          _buildSkillBar('Machine Learning', 0.5),
        ],
      ),
    );
  }

  Widget _buildSkillBar(String skill, double proficiency) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 5),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return LinearProgressIndicator(
                value: _controller.value * proficiency,
                backgroundColor: Colors.white24,
                color: Colors.purple,
                minHeight: 10,
              );
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
      primaryColor: Colors.deepPurple,
      hintColor: Colors.white,
    ),
    home: AboutPage(),
  ));
}
