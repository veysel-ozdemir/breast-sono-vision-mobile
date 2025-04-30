import 'package:breast_sono_vision/presentation/controllers/permission_controller.dart';
import 'package:get/get.dart';

import '../core/network/api_client.dart';
import '../data/repository/api_repository_impl.dart';
import '../data/services/api_service_impl.dart';
import '../domain/usecases/upload_image_usecase.dart';
import '../presentation/controllers/api_controller.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    // Controller
    Get.put(PermissionController(), permanent: true);

    // Core
    final apiClient = ApiClient();

    // Data Layer
    final apiService = ApiServiceImpl(apiClient);
    final apiRepository = ApiRepositoryImpl(apiService);

    // Domain
    final uploadUseCase = UploadImageUseCase(apiRepository);

    // Presentation
    Get.put(uploadUseCase);
    Get.put(ApiController(uploadUseCase));
  }
}
