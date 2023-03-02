import 'package:courtavenue/l10n/l10n.dart';
import 'package:courtavenue/login/utils/utils.dart';

import 'package:flutter/material.dart';

class FormFields extends StatefulWidget {
  const FormFields({
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  bool? fieldsAreValid;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: AutofillGroup(
        child: Column(
          children: [
            TextFormField(
              controller: widget.usernameController,
              autofillHints: const [AutofillHints.username],
              decoration: InputDecoration(
                labelText: context.l10n.username,
                prefixIcon: const Icon(Icons.person),
              ),
              validator: (value) {
                validateFields(value);
                return textFormValidator(value, context);
              },
            ),
            TextFormField(
              controller: widget.passwordController,
              autofillHints: const [AutofillHints.password],
              decoration: InputDecoration(
                labelText: context.l10n.password,
                prefixIcon: const Icon(Icons.lock),
              ),
              obscureText: true,
              validator: (value) {
                validateFields(value);
                return textFormValidator(value, context);
              },
            ),
            if (fieldsAreValid == false)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  context.l10n.youMustEnterAllTheFields,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void validateFields(String? value) {
    if (value == null || value.isEmpty) {
      setState(() {
        fieldsAreValid = false;
      });
      return;
    }
    setState(() {
      fieldsAreValid = true;
    });
  }
}
