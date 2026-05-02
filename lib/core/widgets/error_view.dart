import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const ErrorView({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const .all(24),
        child: Column(
          children: [
            const Icon(Icons.error_outline, size: 64),
            const SizedBox(height: 16),

            Text(message, textAlign: .center),

            const SizedBox(height: 24),

            ElevatedButton(onPressed: onRetry, child: const Text("Retry")),
          ],
        ),
      ),
    );
  }
}
