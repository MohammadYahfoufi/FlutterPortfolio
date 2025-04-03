import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int _currentIndex = 0;

  final List<Service> services = [
    Service(
      title: 'Mobile App Development',
      subtitle:
          'I create mobile applications for both Android and iOS using Flutter.',
      icon: Icons.phone_android,
    ),
    Service(
      title: 'Consultation',
      subtitle:
          'I offer consultation services to help you design and develop your app.',
      icon: Icons.support_agent,
    ),
    Service(
      title: 'Mobile Development',
      subtitle:
          'Expertise in Android Studio and Flutter for creating robust mobile applications.',
      icon: Icons.developer_mode,
    ),
    Service(
      title: 'Game Development',
      subtitle: 'Developing interactive and engaging games using Unity.',
      icon: Icons.videogame_asset,
    ),
    Service(
      title: 'Web Development',
      subtitle: 'Building responsive and dynamic web applications.',
      icon: Icons.web,
    ),
    Service(
      title: 'Firebase Integration',
      subtitle: 'Implementing Firebase services for backend support.',
      icon: Icons.cloud,
    ),
    Service(
      title: 'Cybersecurity and Machine Learning',
      subtitle:
          'Applying cybersecurity measures and machine learning techniques for innovative solutions.',
      icon: Icons.security,
    ),
    Service(
      title: 'Backend Development',
      subtitle: 'Creating reliable and scalable backend systems.',
      icon: Icons.storage,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
        backgroundColor: Colors.deepPurple.withOpacity(0.6),
        leading: Icon(Icons.build),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/thiss.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider.builder(
                itemCount: services.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      color: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.deepPurple, Colors.black87],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              services[index].icon,
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(height: 10),
                            Text(
                              services[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10),
                            Text(
                              services[index].subtitle,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 400,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: services.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => CarouselSlider.builder,
                  child: Container(
                    width: 12.0,
                    height: 12.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.deepPurple
                          : Colors.white,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Service {
  final String title;
  final String subtitle;
  final IconData icon;

  Service({required this.title, required this.subtitle, required this.icon});
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
      primaryColor: Colors.deepPurple,
      hintColor: Colors.white,
    ),
    home: ServicesPage(),
  ));
}
