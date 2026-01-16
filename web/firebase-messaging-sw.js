importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.7.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: 'AIzaSyBnAs0ffIrrUIiszTGz4EzwTiy2_ZRT7GA',
  appId: '1:972196611074:web:f83a65cbbaa26a84ae131b',
  messagingSenderId: '972196611074',
  projectId: 'simple-chat-apps-bb925',
  authDomain: 'simple-chat-apps-bb925.firebaseapp.com',
  storageBucket: 'simple-chat-apps-bb925.firebasestorage.app',
  measurementId: 'G-LBPD9JW4KZ',
});

const messaging = firebase.messaging();

// Handle background messages
messaging.onBackgroundMessage((payload) => {
  console.log('[firebase-messaging-sw.js] Received background message ', payload);

  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: '/icons/Icon-192.png'
  };

  return self.registration.showNotification(notificationTitle, notificationOptions);
});
