import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:technicaltest_danafix/app/utils/enum.dart';

class ConnectivityService {
  StreamController<ConnectivityStatus> connectivityController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((result) {
      connectivityController.add(_connectivityStatus(result));
    });
  }

  ConnectivityStatus _connectivityStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.mobile;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.wifi;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      default:
        return ConnectivityStatus.offline;
    }
  }

  Future<ConnectivityResult> checkConnection() async {
    return Connectivity().checkConnectivity();
  }

  void dispose() => connectivityController.close();
}
