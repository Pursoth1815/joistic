import 'dart:async';
import 'dart:io';

class ConnectivityService {
  final StreamController<bool> _connectivityController = StreamController<bool>.broadcast();
  late Timer _timer;

  ConnectivityService() {
    _startMonitoring();
  }

  Stream<bool> get connectivityStream => _connectivityController.stream;

  void _startMonitoring() {
    _timer = Timer.periodic(Duration(seconds: 5), (_) => _checkConnection());
  }

  Future<void> _checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _connectivityController.sink.add(true);
      } else {
        _connectivityController.sink.add(false);
      }
    } on SocketException catch (_) {
      _connectivityController.sink.add(false);
    }
  }

  void dispose() {
    _timer.cancel();
    _connectivityController.close();
  }
}
