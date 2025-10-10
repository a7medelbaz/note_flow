import 'package:flutter/material.dart';

class WidgetsOfModalBottomSheet {
  Widget buildTextField({
    required String hintText,
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
    BuildContext? context,
  }) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field cannot be empty";
        }
        if (int.tryParse(value) != null) {
          return "This field cannot be a number";
        }
        return null;
      },
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
        backgroundColor:
            Colors.deepPurple, // button color
        foregroundColor:
            Colors.white, // text/icon color
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
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

  void showCustomSnackBar(
    BuildContext context,
    String message,
    Color color,
  ) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top:
            MediaQuery.of(context).size.height *
            0.4,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                16,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Remove after 2 seconds
    Future.delayed(
      const Duration(seconds: 3),
      () => overlayEntry.remove(),
    );
  }
}
