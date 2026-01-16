import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class FirebaseMessagingService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Stream untuk broadcast messages ke UI
  static final StreamController<RemoteMessage> _messageStreamController =
      StreamController<RemoteMessage>.broadcast();

  static Stream<RemoteMessage> get messageStream =>
      _messageStreamController.stream;

  Future<void> initialize() async {
    // Request permission untuk Web
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (kDebugMode) {
      print('User granted permission: ${settings.authorizationStatus}');
    }

    // Get FCM token
    String? token = await _firebaseMessaging.getToken(
      vapidKey:
          'BLAHzFh-DaZnwCxQzbrnSQ98HdNUNV0E7mJ_QDtkVEN2oPBXdQ8Z9yDcSDK_r_nmbiEvctZu4qfTjVT1KJZ6MA8',
    );

    if (kDebugMode) {
      print('FCM Token: $token');
    }

    // Listen to token refresh
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      if (kDebugMode) {
        print('FCM Token refreshed: $newToken');
      }
      // TODO: Send token to your server
    });

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');
      }

      if (message.notification != null) {
        if (kDebugMode) {
          print(
              'Message also contained a notification: ${message.notification}');
        }
        // Broadcast message ke UI
        _messageStreamController.add(message);
      }
    });

    // Handle notification clicks (when app is in background)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (kDebugMode) {
        print('A new onMessageOpenedApp event was published!');
        print('Message data: ${message.data}');
      }
      // TODO: Navigate to specific screen
    });

    // Check if app was opened from terminated state
    RemoteMessage? initialMessage =
        await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      if (kDebugMode) {
        print('App opened from terminated state');
        print('Message data: ${initialMessage.data}');
      }
      // TODO: Navigate to specific screen
    }
  }

  Future<String?> getToken() async {
    try {
      String? token = await _firebaseMessaging.getToken(
        vapidKey:
            'BLAHzFh-DaZnwCxQzbrnSQ98HdNUNV0E7mJ_QDtkVEN2oPBXdQ8Z9yDcSDK_r_nmbiEvctZu4qfTjVT1KJZ6MA8',
      );
      return token;
    } catch (e) {
      if (kDebugMode) {
        print('Error getting FCM token: $e');
      }
      return null;
    }
  }

  void dispose() {
    _messageStreamController.close();
  }
}
