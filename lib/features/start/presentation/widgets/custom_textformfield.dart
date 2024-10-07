import 'package:flutter/material.dart';

// A generic reusable TextFormField widget
class CustomTextFormField extends StatefulWidget {
  final IconData? icon;
  final String? assetPath;
  final String? labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController? controller;
  final bool showSuffixIcon; // New boolean flag to control the suffix icon
  final InputBorder? border; // New property for border decoration
  final Function(String)? onChanged; // New field for the onChanged callback

  // Constructor to accept icon, labelText, obscureText, optional controller, and onChanged callback
  const CustomTextFormField({
    super.key,
    this.icon, // Either icon or assetPath can be provided or neither
    this.assetPath,
    this.labelText,
    this.hintText = '',
    this.obscureText =
        false, // By default, the text is not obscured (e.g., not a password)
    this.validator,
    this.controller, // Optional controller
    this.showSuffixIcon = false,
    this.border, // Use custom border decoration if provided
    this.onChanged, // onChanged callback
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isValid = false;
  bool _isEmpty = true; // Track if the field is empty

  // Method to check if the input is valid and update field status
  void _validateInput(String value) {
    setState(() {
      _isEmpty = value.isEmpty; // Check if the input is empty
      _isValid =
          widget.validator != null ? widget.validator!(value) == null : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (PointerDownEvent event) {
        FocusScope.of(context).unfocus();
      },
      controller: widget.controller, // Use the controller if provided
      obscureText: widget.obscureText, // Obscure text if it's a password field
      decoration: InputDecoration(
        labelStyle: const TextStyle(fontSize: 13),
        prefixIcon: widget.assetPath != null
            ? Padding(
                padding: const EdgeInsets.all(11.0),
                child: Image.asset(
                  widget.assetPath!,
                  width: 24,
                  height: 24,
                ),
              )
            : (widget.icon != null
                ? Icon(widget.icon)
                : null), // Otherwise, no prefixIcon
        suffixIcon: widget.showSuffixIcon && !_isEmpty && _isValid
            ? const Icon(
                Icons.check_sharp,
                size: 20,
              )
            : null, // Conditionally show check icon if valid, not empty, and flag is true
        labelText: widget.labelText != null
            ? '  ${widget.labelText}'
            : null, // Set the label dynamically
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.4),
        ),
        border: widget.border, // Use the provided border decoration
        focusedBorder: widget.border,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      onChanged: (value) {
        _validateInput(value); // Validate input on change
        if (widget.onChanged != null) {
          widget.onChanged!(value); // Trigger the callback if provided
        }
      },
    );
  }
}
