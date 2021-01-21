import 'package:flutter/material.dart';

import 'package:push_app/src/pages/home_page.dart';
import 'package:push_app/src/pages/message_page.dart';

import 'package:push_app/src/providers/push_notification_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() { 
    super.initState();
    
    final PushNotificationProvider pushNotificationProvider = new PushNotificationProvider();
    pushNotificationProvider.configNotification();
    pushNotificationProvider.messageStream.listen((argument) { 
      navigatorKey.currentState.pushNamed('message', arguments: argument);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'message': (BuildContext context) => MessagePage(),
      },
    );
  }
}