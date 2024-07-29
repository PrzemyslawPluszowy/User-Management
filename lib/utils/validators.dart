import 'package:flutter/material.dart';
import 'package:user_management/utils/extension/l10n.dart';

class Validators {
  static String? name(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length < 3) {
      return context.l10n.formToShort3;
    }
    if (value.length > 255) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }
    return null;
  }

  static String? standard(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length > 255) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }
    return null;
  }

  static String? digitOnly(
    String? value,
    BuildContext context, {
    bool isRequired = false,
  }) {
    if (!isRequired && value!.isEmpty) {
      return null;
    }
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length > 255) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }
    if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
      return context.l10n.formOnlyNumber;
    }
    return null;
  }

  static String? postalCode(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length > 6) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }
    if (!RegExp(r'^[0-9]{2}-[0-9]{3}$').hasMatch(value)) {
      return context.l10n.formWronPostCode;
    }
    return null;
  }

  static String? none(
    String? value,
    BuildContext context,
  ) {
    return null;
  }

  static String? houseNumber(
    String? value,
    BuildContext context, {
    bool isRequired = false,
  }) {
    if (!isRequired && value!.isEmpty) {
      return null;
    }
    if (value!.isEmpty) {
      return context.l10n.cantBeEmpty;
    }
    if (value.length > 10) {
      return context.l10n.formToLong;
    }
    if (value.endsWith(' ') || value.startsWith(' ')) {
      return context.l10n.formWhiteSpace;
    }
    if (!RegExp(r'^[0-9a-zA-Z]*$').hasMatch(value)) {
      return context.l10n.formOnlyNumber;
    }
    if (!RegExp('[0-9]').hasMatch(value)) {
      return context.l10n.mustContainOneNumber;
    }

    return null;
  }
}
