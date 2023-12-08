import 'package:flutter/material.dart';
import 'package:prototipo_tcc/view/server_register.dart';

void main() {
  runApp(const ServerRegister());
}

class ServerRegister extends StatelessWidget {
  const ServerRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MQTT Server Setup',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MQTTServerSetupPage(),
    );
  }
}

class MQTTServerSetupPage extends StatefulWidget {
  const MQTTServerSetupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MQTTServerSetupPageState createState() => _MQTTServerSetupPageState();
}

class _MQTTServerSetupPageState extends State<MQTTServerSetupPage> {
  final _formKey = GlobalKey<FormState>();
  String _ipAddress = '';
  String _port = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ServerPage(
            ipAddress: _ipAddress,
            port: _port,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Broker MQTT'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Endereço IP',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Por favor, insira o endereço IP'
                      : null;
                },
                onSaved: (value) => _ipAddress = value!,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Porta',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Por favor, insira a porta'
                      : null;
                },
                onSaved: (value) => _port = value!,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 24.0),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Monitorar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
