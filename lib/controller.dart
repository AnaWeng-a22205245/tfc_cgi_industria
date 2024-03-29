import 'package:flutter/material.dart';
import 'mqttConfigure.dart';


class ControllerPage extends StatelessWidget {
  ControllerPage({super.key});

  final MQTTManager _mqttManager = MQTTManager(host: '127.0.0.1', topic: 'test/topic1');

  void sendOk() {
    _mqttManager.publish('test/topic', 'OK');
  }

  void sendNotOk() {
    _mqttManager.publish('test/topic', 'Not OK');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(navigationsBarList[2].title),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Controller', style: TextStyle(fontSize: 40),),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildControllerButton('OK', Icons.holiday_village, sendOk),
                SizedBox(width: 20,),
                buildControllerButton('NOT OK', Icons.maps_home_work, sendNotOk),
              ],
            ),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }

  Widget buildControllerButton(String label, IconData iconData, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
      ),
      child: TextButton(
        onPressed: () {
          debugPrint('Pressed $label');
        },
        // Utilizando um Row para organizar o ícone e o texto horizontalmente
        child: Row(
          mainAxisSize: MainAxisSize.min,
          // Para garantir que o conteúdo não estique além do necessário
          children: [
            Icon(iconData), // O ícone que você deseja
            SizedBox(width: 10), // Um pequeno espaço entre o ícone e o texto
            Text(label), // O texto que você deseja exibir
          ],
        ),
      ),
    );
  }
}


