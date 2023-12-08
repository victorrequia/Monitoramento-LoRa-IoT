import 'package:flutter/material.dart';
import 'package:prototipo_tcc/auxiliares/mqtt_handler.dart';

class ServerPage extends StatelessWidget {
  final String ipAddress;
  final String port;

  const ServerPage({
    Key? key,
    required this.ipAddress,
    required this.port,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Center',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(
        ipAddress: ipAddress,
        port: port,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  final String ipAddress;
  final String port;

  const MyStatefulWidget({
    Key? key,
    required this.ipAddress,
    required this.port,
  }) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _TesteState();
}

class _TesteState extends State<MyStatefulWidget> {
  late MqttHandler mqttHandler;
  //late DateTime data;
  //String formattedDate;

  @override
  void initState() {
    super.initState();
    mqttHandler = MqttHandler();
    mqttHandler.connect(widget.ipAddress, widget.port);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitoramento'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //SERVIDOR
            /*const SizedBox(height: 15),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage("images/icons/servidor.png"),
                  width: 50,
                ),
                SizedBox(width: 10), // Espaçamento entre ícone e texto
                Text(
                  'Servidor',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),*/

            // const SizedBox(height: 30),
            // Informções do servidor
            // Dia e hora de atualização
            /*const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.cyan,
                        size: 35,
                      ),
                      SizedBox(width: 10), // Espaçamento entre ícone e texto
                      Text("Em teste",
                          style:
                              TextStyle(fontSize: 23, color: Colors.black38)),
                      SizedBox(width: 20),
                      Icon(
                        Icons.timelapse,
                        color: Colors.cyan,
                        size: 35,
                      ),
                      SizedBox(width: 10), // Espaçamento entre ícone e texto
                      Text(
                        "Em teste",
                        style: TextStyle(fontSize: 23, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),
            // CPU e RAM
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage("images/icons/cpu.png"),
                        width: 35,
                      ),
                      SizedBox(width: 10), // Espaçamento entre ícone e texto
                      Text("Em teste",
                          style:
                              TextStyle(fontSize: 23, color: Colors.black38)),
                      SizedBox(width: 20),
                      Image(
                        image: AssetImage("images/icons/ram.png"),
                        width: 35,
                      ),
                      SizedBox(width: 10), // Espaçamento entre ícone e texto
                      Text(
                        "Em teste",
                        style: TextStyle(fontSize: 23, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Divider(color: Colors.grey, height: 32),*/

            // AMBIENTE E TEMPERATURA
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("images/icons/painel-solar.png"),
                  width: 50,
                ),
                SizedBox(width: 10), // Espaçamento entre ícone e texto
                Text(
                  'Ambiente',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),

            // Informações de ambiente e temperatura
            // Data e horario de atualização
            /*const SizedBox(height: 30), // Espaçamento vertical
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.cyan,
                        size: 35,
                      ),
                      SizedBox(width: 10), // Espaçamento entre ícone e texto
                      Text("Em teste",
                          style:
                              TextStyle(fontSize: 23, color: Colors.black38)),
                      SizedBox(width: 20),
                      Icon(
                        Icons.timelapse,
                        color: Colors.cyan,
                        size: 35,
                      ),
                      SizedBox(width: 10), // Espaçamento entre ícone e texto
                      Text(
                        "Em teste",
                        style: TextStyle(fontSize: 23, color: Colors.black38),
                      ),
                    ],
                  ),
                ),
              ],
            ),*/

            const SizedBox(height: 30),
            // Temperatura e raidação
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Image(
                        image: AssetImage("images/icons/temperatura.png"),
                        width: 35,
                      ),
                      const SizedBox(
                          width: 10), // Espaçamento entre ícone e texto
                      ValueListenableBuilder<String>(
                        valueListenable: mqttHandler.data,
                        builder: (context, value, child) {
                          double temperature;
                          try {
                            // Tenta converter o valor para double

                            // Se a conversão for bem-sucedida, verifica se é NaN
                            if (value == "nan") {
                              // Valor é NaN, exibe uma mensagem de alerta
                              return Text(
                                'Alerta: Valor Inválido',
                                style: const TextStyle(
                                  fontSize: 23,
                                  color: Colors
                                      .red, // ou a cor desejada para o alerta
                                ),
                              );
                            }
                          } catch (e) {
                            // Se ocorrer um erro ao converter, trata como NaN
                            // Isso pode ocorrer se o valor não for um número válido
                            temperature = double.nan;
                          }

                          // Se o valor não for NaN, exibe a temperatura normalmente
                          return Text(
                            '$value°C',
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.black38,
                            ),
                          );
                        },
                      ),
                      /*const SizedBox(width: 20),
                      const Image(
                        image: AssetImage("images/icons/uv.png"),
                        width: 35,
                      ),
                      const SizedBox(
                          width: 10), // Espaçamento entre ícone e texto
                      const Text(
                        "Em teste",
                        style: TextStyle(fontSize: 23, color: Colors.black38),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
