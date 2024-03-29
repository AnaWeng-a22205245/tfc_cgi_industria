import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_server_client.dart' as mqtt;

class MQTTManager {
  final String host;
  final String topic;

  mqtt.MqttServerClient? _client;

  MQTTManager({required this.host, required this.topic}) {
    _connect();
  }

  Future<void> _connect() async {
    _client = mqtt.MqttServerClient.withPort(this.host, '#', 1883)
      ..logging(on: true);

    _client!.onConnected = _onConnected;
    _client!.onDisconnected = _onDisconnected;
    _client!.onSubscribed = _onSubscribed;

    try {
      await _client!.connect();
    } catch (e) {
      print('Exception: $e');
      _client!.disconnect();
    }
  }

  void _onConnected() {
    print('Connected');
    _client!.subscribe(this.topic, mqtt.MqttQos.atLeastOnce);
  }

  void _onDisconnected() {
    print('Disconnected');
  }

  void _onSubscribed(String topic) {
    print('Subscribed to topic: $topic');
  }

  void publish(String topic, String message) {
    final builder = mqtt.MqttClientPayloadBuilder();
    builder.addString(message);
    _client!.publishMessage(topic, mqtt.MqttQos.exactlyOnce, builder.payload!);
  }
}
