import 'package:flutter/material.dart';
import 'package:particles_fly/particles_fly.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Backgrounds.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ParticlesFly(
            numberOfParticles: 1000,
            speedOfParticles: 1,
            height: 1000,
            width: 8000,
            onTapAnimation: true,
            particleColor: Colors.purple.withAlpha(150),
            awayAnimationDuration: Duration(milliseconds: 600),
            maxParticleSize: 8,
            isRandSize: true,
            isRandomColor: true,
            randColorList: [
              Colors.deepPurpleAccent,
            ],
            awayAnimationCurve: Curves.easeInOutBack,
            enableHover: true,
            hoverColor: Colors.white,
            hoverRadius: 90,
            connectDots: true,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/pfp.png'),
                    backgroundColor:
                        Colors.transparent,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Mohammad Yahfoufi',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'I am a passionate mobile developer specializing in Flutter and Android Studio. '
                    'I enjoy creating innovative mobile applications that provide an exceptional user experience. '
                    'Let\'s build something amazing together!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
