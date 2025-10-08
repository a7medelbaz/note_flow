import 'package:flutter/material.dart';

class WidgetsOfModalBottomSheet {
    Widget buildTextField({
    required String hintText,
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
    BuildContext? context,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: title,
        floatingLabelBehavior:
            FloatingLabelBehavior
                .always, // 👈 Always at top-left
        labelStyle: TextStyle(
          color: Colors.white.withValues(
            alpha: .4,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey.withValues(
            alpha: .8,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        filled: true,
        fillColor: Theme.of(
          context!,
        ).colorScheme.surface,
      ),
    );
  }

Widget buildElevatedButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepPurple, // button color
      foregroundColor: Colors.white, // text/icon color
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

}