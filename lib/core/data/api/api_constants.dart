class ApiConstants {

  static const globalPrefix = '/api';
  static const port = '3000';

  static const baseUrl = 'https://$baseHost$globalPrefix';
  static const baseHost = 'pixabay.com';

  /// Url for local testing api at emulator
  static const baseLocalUrlForEmulator = 'http://10.0.2.2:$port';

  // Use ipconfig (Windows) get IP's and try all of them
  static const baseLocalUrlExternalDevice = 'http://$baseLocalIpExternalDevice:$port$globalPrefix';
  static const baseLocalIpExternalDevice = '192.168.0.18';

}
