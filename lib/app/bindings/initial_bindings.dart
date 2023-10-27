
import 'package:trade/app/bindings/repository_bindings.dart';
import 'package:trade/app/bindings/service_bindings.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {

    ServiceBindings().dependencies();
    RepositoryBindings().dependencies();

  }
}