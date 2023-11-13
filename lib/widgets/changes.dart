import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangeAddress extends StatefulWidget {
  @override
  _ChangeEmailPageState createState() => _ChangeEmailPageState();
}

class _ChangeEmailPageState extends State<ChangeAddress> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorMessage = '';

  Future<void> _changeEmail() async {
    try {
      final User? user = _auth.currentUser;

      if (user != null) {
        final AuthCredential credential = EmailAuthProvider.credential(
          email: user.email!,
          password: _passwordController.text,
        );

        await user.reauthenticateWithCredential(credential);
        await user.updateEmail(_newEmailController.text);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email address updated successfully!'),
          ),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Change Email'),
      ),
      body: Padding(
        padding:const  EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _newEmailController,
              decoration:const InputDecoration(labelText: 'New Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _changeEmail,
              child:const Text('Change Email'),
            ),
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style:const  TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
