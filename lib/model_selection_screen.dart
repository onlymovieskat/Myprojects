// Model Selection Screen
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ai_ml_model_manager.dart';
import 'chat_screen.dart';

class ModelSelectionScreen extends StatefulWidget {
  final AIMLModelManager modelManager;

  const ModelSelectionScreen({super.key, required this.modelManager});

  @override
  _ModelSelectionScreenState createState() => _ModelSelectionScreenState();
}

class _ModelSelectionScreenState extends State<ModelSelectionScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select AI Model 🤖')),
      body: ListView.builder(
        itemCount: widget.modelManager.models.length,
        itemBuilder: (context, index) {
          final model = widget.modelManager.models[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                gradient: selectedIndex == index
                    ? LinearGradient(
                        colors: [Colors.blue.shade200, Colors.blue.shade400],
                      )
                    : const LinearGradient(
                        colors: [Colors.white, Colors.white70],
                      ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  splashColor: Colors.blue.withOpacity(0.2),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    // Delay to allow the animation to be visible before navigating.
                    Future.delayed(const Duration(milliseconds: 300), () {
                      widget.modelManager.selectModel(model);
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              ChatScreen(model: model),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    });
                  },
                  child: ListTile(
                    leading: Hero(
                      tag: 'modelIcon_$index',
                      child: CircleAvatar(
                        backgroundColor: Colors.blue.shade300,
                        child: Text(
                          model.displayName.characters.first.toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    title: Text(
                      model.displayName,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Provider: ${model.provider}'),
                    trailing: const Icon(Icons.arrow_right),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
