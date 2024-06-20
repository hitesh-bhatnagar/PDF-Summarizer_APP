import 'dart:io';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PdfProvider extends ChangeNotifier {
  File? _pdfFile;
  String? _summary;
  bool _isLoading = false;
  String? _error;

  void setPdfFile(File file) {
    _pdfFile = file;
    _summary = null;  // Reset summary when a new file is picked
    _error = null;    // Reset error when a new file is picked
    notifyListeners();
  }

  String? get summary => _summary;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> extractText() async {
    if (_pdfFile != null) {
      try {
        _isLoading = true;
        notifyListeners();

        final text = await _extractTextFromPdf(_pdfFile!);
        print("Extracted text: $text"); // Debugging: Print extracted text
        final summary = await _summarizeText(text);
        print("Summarized text: $summary"); // Debugging: Print summarized text

        _summary = summary;
      } catch (e) {
        _error = e.toString();
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    }
  }

  Future<String> _extractTextFromPdf(File file) async {
    final document = PdfDocument(inputBytes: file.readAsBytesSync());
    final textExtractor = PdfTextExtractor(document);
    String extractedText = '';

    for (int i = 0; i < document.pages.count; i++) {
      final text = textExtractor.extractText(startPageIndex: i, endPageIndex: i);
      extractedText += text;
    }
    
    return extractedText;
  }

  Future<String> _summarizeText(String text) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/completions'),
      headers: {
        'Authorization': 'Bearer ENTER_OPENAI_API_KEY',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo-instruct',
        'prompt': 'Summarize the following text:\n\n$text',
        'max_tokens': 150,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['choices'][0]['text'].trim();
    } else {
      throw Exception('Failed to summarize text: ${response.body}');
    }
  }
}
