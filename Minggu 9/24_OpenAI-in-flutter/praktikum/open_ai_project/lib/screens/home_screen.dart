import 'package:flutter/material.dart';
import 'package:open_ai_project/widgets/text_form_field_widgets.dart';

import '../services/recommendation.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _budgetController = TextEditingController();
  final TextEditingController _cameraController = TextEditingController();
  final TextEditingController _storageController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _budgetController.dispose();
    _cameraController.dispose();
    _storageController.dispose();
    super.dispose();
  }

  void _getRecommendations() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await RecommendationService.getRecommendations(
        budget: _budgetController.value.text,
        camera: _cameraController.value.text,
        storage: _storageController.value.text
      );

      if (mounted) {
        setState(() {
          isLoading = false;
        });

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return ResultScreen(gptResponseData: result);
            },
          ),
        );
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Failed to send a request. Please try again.'),
      );

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Phone Recommendation App'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                heightFactor: 4,
                child: Text(
                  'Phone Recommendations by AI',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Please enter your budget in IDR",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right:20, top : 16, bottom: 25),
                child: TextFormFieldWidget(
                  controller: _budgetController,
                  labelText: "Budget",
                  hintText: 'Enter your budget (in IDR)'
                )
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Please enter your desired Camera",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right:20, top : 16, bottom: 25),
                child: TextFormFieldWidget(
                  controller: _cameraController,
                  labelText: "Camera (MP)",
                  hintText: "Enter your requirement for the Camera (MP)"
                )
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Please enter your desired internal Storage",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right:20, top : 16, bottom: 25),
                child: TextFormFieldWidget(
                  controller: _storageController,
                  labelText: "Internal Storage",
                  hintText: 'Enter your desired internal Storage (GB)'
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: isLoading && _formKey.currentState!.validate() != false
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple
                      ),
                      onPressed: _getRecommendations,
                      child: const Center(
                        child: Text("GET RECOMMENDATIONS"),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
