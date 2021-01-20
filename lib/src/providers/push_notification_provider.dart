import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

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
    //* ccGgbuLATo-FStmMxt1Vj6:APA91bF6GgNJdCsXrcnSjWvq9RcE3T5f_kpoSwW8KNkN6oCLzSMRxYVXbRLNYc_lYyWr2RjuHetptgGNIXKhg8Oh-BE7Y1uKijpc2RARmrIutn14V0VkPKLDMx-QCrhX20cjfX3SMh-K

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    print('===== onMessage =====');
    print('message: $message');
  }
  
  Future<dynamic> onLaunch(Map<String, dynamic> message) async {
    print('===== onLaunch =====');
    print('message: $message');
  }
  
  Future<dynamic> onResume(Map<String, dynamic> message) async {
    print('===== onResume =====');
    print('message: $message');
  }
}
