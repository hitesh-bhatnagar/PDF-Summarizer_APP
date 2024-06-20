import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pdf_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'splash_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Summarizer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  print("Picked file path: ${file.path}"); // Debugging: Print file path
                  Provider.of<PdfProvider>(context, listen: false).setPdfFile(file);
                  await Provider.of<PdfProvider>(context, listen: false).extractText();
                }
              },
              child: const Text('Pick PDF'),
            ),
            Consumer<PdfProvider>(
              builder: (context, provider, child) {
                if (provider.summary != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(provider.summary!),
                  );
                } else if (provider.isLoading) {
                  return const CircularProgressIndicator();
                } else if (provider.error != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Error: ${provider.error}'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

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
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
