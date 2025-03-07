import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/dracula.dart';
import 'package:highlight/highlight.dart' as hl;

// ================== Data Model ==================
class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final bool hasError;
  final String? imageUrl;

  const Message({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.hasError = false,
    this.imageUrl,
  });
}

// ================== Syntax Highlighter ==================
class ChatSyntaxHighlighter extends SyntaxHighlighter {
  final Map<String, TextStyle> theme;
  final String? defaultLanguage;

  ChatSyntaxHighlighter({
    this.defaultLanguage,
    this.theme = draculaTheme,
  });

  @override
  TextSpan format(String source) {
    final nodes = hl.highlight.parse(source, language: defaultLanguage).nodes;
    return _buildSpan(nodes ?? []);
  }

  TextSpan _buildSpan(List<hl.Node> nodes) {
    final List<TextSpan> spans = [];

    for (final node in nodes) {
      if (node.value != null) {
        spans.add(TextSpan(
          text: node.value,
          style: theme[node.className],
        ));
      }
      if (node.children != null) {
        spans.add(_buildSpan(node.children!));
      }
    }

    return TextSpan(
      style: const TextStyle(fontFamily: 'FiraCode', fontSize: 14),
      children: spans,
    );
  }
}

// ================== Message Bubble Widget ==================
class MessageBubble extends StatefulWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _copyController;
  late Animation<double> _copyScaleAnimation;
  bool _isCopied = false;
  double _emojiScale = 1.0;

  @override
  void initState() {
    super.initState();
    _copyController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _copyScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _copyController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _copyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.85,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.message.isUser
                ? Theme.of(context).primaryColor
                : Colors.grey.shade200,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
              bottomLeft: widget.message.isUser
                  ? const Radius.circular(20)
                  : const Radius.circular(4),
              bottomRight: widget.message.isUser
                  ? const Radius.circular(4)
                  : const Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.message.imageUrl != null) _buildImage(),
              _buildContent(),
              const SizedBox(height: 8),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          widget.message.imageUrl!,
          width: 250,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, progress) {
            if (progress == null) return child;
            return Container(
              width: 250,
              height: 150,
              color: Colors.grey.shade300,
              child: Center(
                child: CircularProgressIndicator(
                  value: progress.expectedTotalBytes != null
                      ? progress.cumulativeBytesLoaded /
                          progress.expectedTotalBytes!
                      : null,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Container(
            width: 250,
            height: 150,
            color: Colors.red.shade100,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, color: Colors.red),
                Text('Failed to load image'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    final trimmedText = widget.message.text.trim();
    final isCodeBlock =
        trimmedText.startsWith('```') && trimmedText.endsWith('```');

    return GestureDetector(
      onTap: _animateEmoji,
      child: AnimatedScale(
        scale: _emojiScale,
        duration: const Duration(milliseconds: 200),
        child: isCodeBlock
            ? _buildCodeContent(trimmedText)
            : widget.message.isUser
                ? SelectableText(
                    widget.message.text,
                    style: TextStyle(
                      fontSize: 16,
                      color: widget.message.isUser ? Colors.white : Colors.black,
                    ),
                  )
                : MarkdownBody(
                    data: widget.message.text,
                    selectable: true,
                    syntaxHighlighter: ChatSyntaxHighlighter(
                      defaultLanguage: 'dart',
                    ),
                    styleSheet: MarkdownStyleSheet(
                      p: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        height: 1.4,
                      ),
                      a: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      code: const TextStyle(
                        backgroundColor: Colors.black12,
                        fontFamily: 'FiraCode',
                        fontSize: 14,
                      ),
                    ),
                  ),
      ),
    );
  }

  Widget _buildCodeContent(String text) {
    final codeContent = text.substring(3, text.length - 3).trim();
    final lines = codeContent.split('\n');
    String language = 'dart';
    String code = codeContent;

    if (lines.isNotEmpty) {
      final firstLine = lines.first.trim();
      if (_isValidLanguage(firstLine)) {
        language = firstLine;
        code = lines.skip(1).join('\n').trim();
      } else {
        language = _detectLanguage(codeContent);
      }
    }

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HighlightView(
              code,
              language: language,
              theme: draculaTheme,
              padding: const EdgeInsets.all(8),
              textStyle: const TextStyle(
                fontFamily: 'FiraCode',
                fontSize: 14,
              ),
            ),
          ),
          _buildCopyButton(),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('h:mm a').format(widget.message.timestamp),
          style: TextStyle(
            fontSize: 12,
            color: widget.message.isUser ? Colors.white70 : Colors.grey.shade600,
          ),
        ),
        _buildCopyButton(),
      ],
    );
  }

  Widget _buildCopyButton() {
    return ScaleTransition(
      scale: _copyScaleAnimation,
      child: IconButton(
        icon: Icon(
          _isCopied ? Icons.check : Icons.content_copy,
          size: 20,
          color:
              widget.message.isUser ? Colors.white70 : Colors.grey.shade600,
        ),
        onPressed: _handleCopy,
      ),
    );
  }

  void _handleCopy() async {
    final text = widget.message.text
        .replaceAll(RegExp(r'^```.*?\n'), '')
        .replaceAll(RegExp(r'```$'), '');

    await Clipboard.setData(ClipboardData(text: text));

    setState(() => _isCopied = true);
    _copyController.forward().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isCopied = false);
          _copyController.reverse();
        }
      });
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _animateEmoji() {
    setState(() => _emojiScale = 1.2);
    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) setState(() => _emojiScale = 1.0);
    });
  }

  bool _isValidLanguage(String language) {
    const supported = {
      'dart',
      'python',
      'java',
      'javascript',
      'js',
      'cpp',
      'c',
      'cs',
      'go',
      'ruby',
      'swift',
      'kotlin',
      'php',
      'html',
      'css',
      'xml',
      'sql',
      'json',
      'yaml',
      'bash',
      'shell',
      'sh',
      'http',
      'markdown',
      'md',
      'text'
    };
    return supported.contains(language.toLowerCase());
  }

  String _detectLanguage(String code) {
    final patterns = {
      'dart': RegExp(r'\b(main|void|class|extends|Widget)\b'),
      'javascript': RegExp(r'\b(function|console\.log|=>|import\s+from)\b'),
      'python': RegExp(r'\b(def|class|print|lambda|import\s+)\b'),
      'java': RegExp(r'\b(public\s+class|System\.out\.println|import\s+java\.)\b'),
      'html': RegExp(r'<\/?[a-z][\s\S]*>'),
      'css': RegExp(r'[.#][a-z]+\s*{'),
      'json': RegExp(r'^\s*[{[]'),
      'yaml': RegExp(r'^\s*[a-zA-Z]+:'),
      'bash': RegExp(r'^\s*(sudo|apt|echo|curl)\b'),
    };

    for (final entry in patterns.entries) {
      if (entry.value.hasMatch(code)) return entry.key;
    }
    return 'text';
  }
}


