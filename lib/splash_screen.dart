import 'package:flutter/material.dart';
import 'homepage.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    ) ..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);

    // Navigate to HomePage after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
  }

@override
void dispose() {
  _controller?.dispose();
  super.dispose();

}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FadeTransition(
          opacity: _animation!,
          child: Image.asset('assets/splash_screen/home_page.png',width:200),
        ),
        SizedBox(height: 20),
        CircularProgressIndicator(),
        SizedBox(height: 20),
        Text(
          'Loading...',
          style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),

        ),
      ],
    ),
    ),
  );
}
}