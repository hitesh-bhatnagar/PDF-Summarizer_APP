import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pdf_provider.dart';
import 'splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PdfProvider(),
      child: MaterialApp(
        title: 'PDF Summarizer',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
