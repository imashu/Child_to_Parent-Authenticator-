import 'package:flutter/material.dart';

class Authenticator extends StatefulWidget {
  const Authenticator({Key? key, required this.onAuthenticated});
  final ValueChanged<bool> onAuthenticated;

  @override
  _AuthenticatorState createState() =>
      _AuthenticatorState(onAuthenticated: onAuthenticated);
}

class _AuthenticatorState extends State<Authenticator> {
  _AuthenticatorState({Key? key, required this.onAuthenticated});

  TextEditingController? _user;
  TextEditingController? _pass;
  final ValueChanged<bool> onAuthenticated;

  void _onPressed() {
    if (_user?.text != 'user' || _pass!.text != '1234') {
      onAuthenticated(false);
    } else {
      onAuthenticated(true);
    }
  }

  @override
  void initState() {
    _pass = TextEditingController();
    _user = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _user,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _pass,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: _onPressed,
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
