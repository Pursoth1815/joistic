import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectivityService extends GetxService {
  final RxBool isConnected = true.obs;
  late StreamSubscription<InternetConnectionStatus> _subscription;

  @override
  void onInit() {
    super.onInit();
    _initializeConnectivity();
  }

  void _initializeConnectivity() {
    _subscription = InternetConnectionChecker().onStatusChange.listen(_updateConnectionStatus);
    _checkInitialConnection();
  }

  Future<void> _checkInitialConnection() async {
    bool initialStatus = await InternetConnectionChecker().hasConnection;
    isConnected.value = initialStatus;
  }

  void _updateConnectionStatus(InternetConnectionStatus status) {
    if (status == InternetConnectionStatus.disconnected) {
      isConnected.value = false;
    } else {
      isConnected.value = true;
    }
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }
}
