import 'package:flutter/material.dart'; 
import 'aI_service.dart';
import 'ai_ml_model_manager.dart';
import 'messege_model.dart';

class ChatScreen extends StatefulWidget {
  final AIMLModel model;

  const ChatScreen({super.key, required this.model});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  final List<Message> _messages = [];
  bool _isLoading = false;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Set up animation controller for the greeting text.
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _sendMessage(String text) async {
    if (text.isEmpty) return;

    setState(() {
      _messages.add(Message(text: text, isUser: true, timestamp: DateTime.now()));
      _isLoading = true;
    });

    try {
      final response = await AIService.getResponse(
        model: widget.model.id,
        systemPrompt: "You are an Expert in every field be concise and help",
        userMessage: text,
      );

      if (response.startsWith('Error:')) {
        _showErrorDialog(response);
      } else {
        setState(() {
          _messages.add(Message(text: response, isUser: false, timestamp: DateTime.now()));
          _isLoading = false;
        });
      }
    } catch (e) {
      _showErrorDialog('Connection error: $e');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.displayName),
        backgroundColor: Colors.blue[800],
      ),
      // Wrap the existing Column in a Stack so we can overlay the greeting text.
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: _messages.length + (_isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < _messages.length) {
                      final message = _messages.reversed.toList()[index];
                      return MessageBubble(message: message);
                    }
                    return const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
              ChatInputField(onSend: _sendMessage),
            ],
          ),
          // Show the centered greeting only when there are no messages.
          if (_messages.isEmpty)
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Text(
                    'Hi, We are here to help you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ChatInputField extends StatefulWidget {
  final Function(String) onSend;

  const ChatInputField({super.key, required this.onSend});

  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Adds spacing
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeInOut,
        height: _isTyping ? 55 : 42, // Expands when typing
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            if (_isTyping)
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                offset: const Offset(2, 2),
              ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _controller,
                onTap: () => setState(() => _isTyping = true),
                onSubmitted: _send,
                decoration: const InputDecoration(
                  hintText: "Type a message...",
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send, color: Colors.blue),
              onPressed: () => _send(_controller.text),
            ),
          ],
        ),
      ),
    );
  }

  void _send(String value) {
    if (value.trim().isNotEmpty) {
      widget.onSend(value);
      _controller.clear();
    }
    setState(() => _isTyping = false);
  }
}
