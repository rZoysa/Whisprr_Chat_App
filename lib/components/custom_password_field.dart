import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const CustomPasswordField({
    super.key,
    required this.label,
    this.validator,
    this.suffixIcon,
    this.controller,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscurePassword,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: const TextStyle(
          fontSize: 20,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
          icon: Icon(
            color: Colors.black54,
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
