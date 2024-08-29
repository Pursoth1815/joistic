import 'package:get/get.dart';
import 'package:joistic/core/services/internet_connectivity.dart';

class ConnectivityController extends GetxController {
  final ConnectivityService _connectivityService = ConnectivityService();
  final RxBool isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();
    _connectivityService.connectivityStream.listen((status) {
      isConnected.value = status;
    });
  }

  @override
  void onClose() {
    _connectivityService.dispose();
    super.onClose();
  }
}
