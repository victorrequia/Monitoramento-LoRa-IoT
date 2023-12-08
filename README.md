# Monitoramento-LoRa-IoT
 
Para implementar o protótipo, siga as etapas:

## Broker MQTT
1° Baixe o broker MQTT Mosquitto em sua máquina local (https://mosquitto.org/download/)

2° Coloque o arquivo broker.conf na pasta do código fonte do Broker MQTT Mosquitto

3° Para deixar o broker online, abra o cmd na pasta do código fonte e digite o seguinte comando: mosquitto -v -c broker.conf

## Interface
1° Para ter o aplicatico e instalar em seu celular, precisa ter instalado na máquina flutter versão 3.13.3 e Dart versão 3.1.1

2° Ative o modo desenvolvedor no seu celular e conecte ao computador com as ferramentas do 1° passo intaladas

3° Na IDE (preferencialmente Visual Studio Code) de desenvolvimento selecione o celular conectado para instalar o aplicativo

4° Na pasta do código, rode o comando: flutter clean & flutter pub get & flutter run

## ESP32 LoRa
1° Use preferencialemnte a Arduino IDE para desenvolver e compilar o código

2° Instale as bibliotecas: LoRa Node, DHT Sensor Library, Heltec ESP32 Dev-board (encontrada nesse link https://docs.heltec.org/en/node/esp32/esp32_general_docs/quick_start.html#via-arduino-board-manager)

3° No arquivo receiver na pasta ESP32, altere os dados para sua rede Wifi e o IP do seu broker MQTT (para saber o IP, abra o cmd no computador que esta hospendando o broker MQTT e digite o comando ipconfig para Windows e if config para Linux)

4° Compile o código no seu ESP32 LoRa
