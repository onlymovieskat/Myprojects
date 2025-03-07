import 'package:flutter/material.dart';
import 'ai_ml_model_manager.dart';
import 'model_selection_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      home: ModelSelectionScreen(modelManager: AIMLModelManager()),
    ),
  );
}

