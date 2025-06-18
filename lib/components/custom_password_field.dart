import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String label;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  const CustomPasswordField({
    super.key,
    required this.label,
    this.textInputAction = TextInputAction.done,
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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      controller: widget.controller,
      obscureText: _obscurePassword,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: (value) {
        FocusScope.of(context).nextFocus();
      },
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 20,
          color: colorScheme.secondary,
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
            color: colorScheme.secondary,
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      validator: widget.validator,
    );
  }
}
