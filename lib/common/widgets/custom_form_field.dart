import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:user_management/utils/validators.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.label,
    required this.controller,
    super.key,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.inputFormatters = const [],
    this.isPhone = false,
    this.maxLine,
    this.minLine,
  });
  factory CustomFormField.phone({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return CustomFormField(
      label: label,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      textInputType: TextInputType.phone,
      isPhone: true,
    );
  }

  factory CustomFormField.numberOnly({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return CustomFormField(
      label: label,
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      textInputType: TextInputType.number,
    );
  }

  final String label;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final bool isPhone;
  final int? maxLine;
  final int? minLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      minLines: minLine,
      keyboardType: textInputType,
      obscureText: obscureText,
      controller: controller,
      validator: validator ?? (query) => Validators.standard(query, context),
      inputFormatters: isPhone
          ? [
              MaskedInputFormatter('### ###-##-##-##'),
            ]
          : inputFormatters,
      decoration: InputDecoration(
        constraints: const BoxConstraints(
          maxHeight: 70,
          minHeight: 70,
        ),
        border: const OutlineInputBorder(),
        isDense: true,
        labelText: label,
      ),
    );
  }
}
