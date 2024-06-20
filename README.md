# PDF Summarizer App

![App Demo](demo.gif)

This Flutter application allows users to upload PDF or DOC files and uses the OpenAI API to generate concise summaries of the text within these documents. The aim is to provide users with important information in an easily understandable format, enabling quicker reading and comprehension.

## Features

- **File Upload**: Users can upload PDF or DOC files directly from their device.
- **Text Summarization**: Utilizes OpenAI API to summarize the uploaded documents.
- **Summary Display**: Displays summarized text in a user-friendly manner within the app.
- **Save and Share**: Options to save or share the summarized content for future reference.

## Getting Started

To run this application locally or contribute to its development, follow these steps:

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/pdf-summarizer-app.git
   ```

2. **Navigate into the project directory**:

   ```bash
   cd pdf-summarizer-app
   ```

3. **Install dependencies**:

   ```bash
   flutter pub get
   ```

4. **Set up OpenAI API**:
   - Obtain API keys from OpenAI (visit [OpenAI](https://www.openai.com/) for details).
   - Replace `YOUR_API_KEY_HERE` in `lib/services/openai_service.dart` with your actual OpenAI API key.

5. **Run the app**:

   ```bash
   flutter run
   ```

## Usage

- Launch the app on your device.
- Upload a PDF or DOC file using the provided interface.
- Wait for the app to process the document using the OpenAI API.
- View the summarized content displayed within the app.

## Contributing

Contributions are welcome! If you'd like to enhance this project, here are a few suggestions:

- Improve file handling and error checking during uploads.
- Enhance UI/UX for better user interaction.
- Implement caching mechanisms to store previous summaries.
- Support more file formats and document types.

To contribute:

1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some amazing feature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a pull request.

## License

Distributed under the MIT License. See `LICENSE` for more information.

- Project Link: [https://github.com/your-username/pdf-summarizer-app](https://github.com/hitesh-bhatnagar/PDF-Summarizer_APP.git)
