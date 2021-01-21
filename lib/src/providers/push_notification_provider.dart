import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final StreamController<String> _messageStreamController = StreamController<String>.broadcast();
  
  Stream<String> get messageStream => _messageStreamController.stream;

  static Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  configNotification() async {
    await _firebaseMessaging.requestNotificationPermissions();

    final token = await _firebaseMessaging.getToken();

    print('===== FCM Token =====');
    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print('===== onMessage =====');
    //print('message: $message');
    final argument = message['data']['food'];
    //print('argument: $argument');
    _messageStreamController.sink.add(argument);
  }
  
  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print('===== onLaunch =====');
    //print('message: $message');
    final argument = message['data']['food'];
    //print('argument: $argument');
    _messageStreamController.sink.add(argument);
  }
  
  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print('===== onResume =====');
    //print('message: $message');
    final argument = message['data']['food'];
    //print('argument: $argument');
    _messageStreamController.sink.add(argument);
  }
  
  void dispose() {
    _messageStreamController?.close();
  }
}
