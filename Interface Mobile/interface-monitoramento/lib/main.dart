import 'package:flutter/material.dart';
import 'package:prototipo_tcc/view/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ServerRegister(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/icons/unnamed.png', // Substitua pelo caminho real da sua imagem
            width: 130, // Ajuste o tamanho conforme necessário
            height: 130,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Login'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira seu login';
              }
              return null;
            },
            onSaved: (value) => _email = value!,
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(labelText: 'Senha'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira sua senha';
              }
              return null;
            },
            onSaved: (value) => _password = value!,
          ),
          ElevatedButton(
            onPressed: _submit,
            child: const Text('Entrar'),
          ),
        ],
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Processo de login

      // Navega para a HomePage e remove a tela de login da pilha
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ServerRegister()),
      );
    }
  }
}
