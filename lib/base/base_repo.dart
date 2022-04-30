import '../network/network_manager.dart';

abstract class BaseRepo {
  late NetworkManager networkManager;

  BaseRepo() {
    networkManager = NetworkManager();
  }
}
