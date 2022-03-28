import 'package:flutter/material.dart';
import 'package:food_delivery/view/home_page/home_page.dart';
import 'create_account_button.dart';
import 'error_text.dart';


class FormFields extends StatefulWidget {
  FormFields({Key? key}) : super(key: key);

  @override
  State<FormFields> createState() => _FormFieldsState();
}

class _FormFieldsState extends State<FormFields> {
  final _formKey = GlobalKey<FormState>();

  bool passError = false;
  bool nameError = false;
  bool emailError = false;

  String? errorText;

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          TextFormField(
            decoration: const InputDecoration(
              hintText: 'What do people call you?',
              labelText: 'Email ',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                setState(() {
                  errorText = emailError ? 'Maydonlarni to\'ldiring!' : null;
                });
                emailError = true;
              } else if (!(RegExp('@').hasMatch(value))) {
                setState(() {
                  emailError = true;
                  errorText = emailError ? '@ belgi bo\'lishi kerak!'
                      : null;
                });
              } else {
                setState(() {
                  emailError = false;
                });
              }
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'What do people call you?',
              labelText: 'Password ',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                setState(() {
                  errorText = passError ? 'Maydonlarni to\'ldiring!' : null;
                });
                passError = true;
              } else if (value.length < 8) {
                setState(() {
                  passError = true;
                  errorText = passError
                      ? 'Parol belgilar soni kamida 8 ta bo\'lishi kerak!'
                      : null;
                });
              } else {
                setState(() {
                  passError = false;
                });
              }
            },
          ),
          ErrorText(errorText: errorText),
          CreateButton(
            func: _func,
          ),
        ],
      ),
    );
  }

  void _func() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.setState(() {});
      if (!passError && !emailError & !nameError) {
        Navigator.pushNamed(context, HomePage.id);
        errorText = null;
      } else {
        print('error');
      }
    } else {
      print('error');
    }
  }
}