import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:onboarding_pdi/screens/dashboard.dart';
import '../http/webclients/onboarding_webclient.dart';
import '../models/onboarding.dart';

class OnboardingForm extends StatefulWidget {
  @override
  _OnboardingFormState createState() => _OnboardingFormState();
}

class _OnboardingFormState extends State<OnboardingForm> {
  final TextEditingController _nameController = TextEditingController();
  final MaskedTextController _cpfController =
      MaskedTextController(mask: '000.000.000-00');

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  final OnboardingWebClient _webClient = OnboardingWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abra Sua Conta'),
        backgroundColor: Color(0xFF133b3c),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome completo *',
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _cpfController,
                    decoration: InputDecoration(
                      labelText: 'CPF *',
                    ),
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'E-mail *',
                    ),
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Crie uma senha *',
                    ),
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: _passwordConfirmController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      labelText: 'Confirme sua senha *',
                    ),
                    style: TextStyle(
                      fontSize: 24.0,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      child: Text('Create'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xFF133b3c),
                        ),
                      ),
                      onPressed: () async {
                        final String? name = _nameController.text;
                        final String? cpf = _cpfController.text
                            .replaceAll('.', '')
                            .replaceAll('-', '');
                        final String? password = _passwordController.text;
                        final String? confirmPassword =
                            _passwordConfirmController.text;
                        final String? email = _emailController.text;

                        if (password != confirmPassword) {
                          await _showMyDialog(
                            'Senhas não conferem.',
                          );
                          return Navigator.pop(context);
                        }
                        final Onboarding onboardingCreated =
                            Onboarding(name, cpf, password, '', email);

                        _webClient
                            .save(onboardingCreated)
                            .then((onboardingResult) {
                          _showMyDialog(onboardingResult.status as String);
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(String message) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Dashboard(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
