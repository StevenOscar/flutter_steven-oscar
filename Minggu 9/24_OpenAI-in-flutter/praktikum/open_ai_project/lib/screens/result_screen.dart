import 'package:flutter/material.dart';
import '../models/gpt_data_model.dart';

class ResultScreen extends StatelessWidget {
  final GptDataModel gptResponseData;

  const ResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Recommendations Result'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top : 35, left: 30, right :30),
              child: Text(
                "Phone Recommendations \nbased on OpenAI",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
              child: Text(
                gptResponseData.choices[0].text,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.3,
                  letterSpacing: 0.5
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
