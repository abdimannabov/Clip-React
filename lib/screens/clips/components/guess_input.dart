import 'package:flutter/material.dart';

class GuessInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSubmit;
  final VoidCallback? onLockedTap;
  final bool isEnabled;
  final bool isSubmitting;
  final String hintText;
  final String submitLabel;

  const GuessInput({
    required this.controller,
    required this.onSubmit,
    this.onLockedTap,
    required this.isEnabled,
    required this.isSubmitting,
    this.hintText = 'Type your guess ...',
    this.submitLabel = 'Submit',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      height: 46,
      width: 220,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white12, width: 2),
      ),
      child: Stack(
        children: [
          TextField(
            controller: controller,
            readOnly: !isEnabled,
            style: const TextStyle(color: Colors.white),
            onSubmitted: (_) {
              if (isEnabled) {
                onSubmit();
              } else {
                onLockedTap?.call();
              }
            },
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white54),
              border: InputBorder.none,
            ),
          ),
          Positioned(
            right: 3,
            top: 3,
            bottom: 3,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: isEnabled ? onSubmit : onLockedTap,
                child: Container(
                  width: 68,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2D2C2C).withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      isSubmitting ? '...' : submitLabel,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
