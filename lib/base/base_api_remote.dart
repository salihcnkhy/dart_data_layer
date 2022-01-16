import 'package:network_layer/interfaces/network_manager_interface.dart';

abstract class BaseApiRemote<SP> {
  final NetworkManagerInterface networkManager;
  final SP serviceProvider;

  BaseApiRemote({required this.networkManager, required this.serviceProvider});
}
