import 'package:flutter/material.dart';
import 'package:food_delivery/view/regester_pages/sign_up_button.dart';
import 'package:provider/provider.dart';

import '../../view_model/auth_view_model.dart';
import '../home_page/home_page.dart';
import 'error_text.dart';
class SingUpFormFilds extends StatefulWidget {
  const SingUpFormFilds({Key? key}) : super(key: key);
  static const String id="sign_up_form_filds";

  @override
  _SingUpFormFildsState createState() => _SingUpFormFildsState();
}

class _SingUpFormFildsState extends State<SingUpFormFilds> {
  final _formKey = GlobalKey<FormState>();

  bool passError = false;
  bool nameError = false;
  bool emailError = false;
  bool _isLoading = false;


  String name = "";
  String email = "";
  String pass = "";

  String? errorText;


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Consumer<AuthViewModel>(builder: (context, data, child) {
          if (data.authStatus == AuthStatus.LOADING) {
            return const CircularProgressIndicator();
          }
          if (data.authStatus == AuthStatus.COMPLETED) {
            Future.delayed(Duration.zero, () async {
              Navigator.pushNamedAndRemoveUntil(
                  context, HomePage.id, (r) => false);
            });
          }
          if (data.authStatus == AuthStatus.ERROR) {
            return Center(child: Text(data.errorMessage ?? "ERROR"));
          }
          return Column(
            children: [

              TextFormField(
                onSaved: (value) {
                  name = value!;
                },
                decoration: const InputDecoration(
                  hintText: 'What do people call you?',
                  labelText: 'Name ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    nameError = true;
                    setState(() {
                      errorText = nameError ? 'Maydonlarni to\'ldiring!' : null;
                    });
                  } else {
                    setState(() {
                      nameError = false;
                    });
                  }
                },
              ),
              TextFormField(
                onSaved: (value) {
                  email = value!;
                },
                decoration: const InputDecoration(
                  hintText: 'What do people call you?',
                  labelText: 'Email ',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    setState(() {
                      errorText =
                      emailError ? 'Maydonlarni to\'ldiring!' : null;
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
                onSaved: (value) {
                  pass = value!;
                },
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
              SignUpButton(
                func: _func,
              ),
            ],
          );
        }));
  }
  void _func(context) {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();

      _createAccount();

      if (!passError && !emailError & !nameError) {
        errorText = null;
      } else {
        print('error');
      }
    } else {
      print('error');
    }
  }

  _createAccount() async {
    final authVM = Provider.of<AuthViewModel>(context, listen: false);

    setState(() {
      _isLoading = true;
    });

    authVM.createUser(name, email, pass);
  }

}

