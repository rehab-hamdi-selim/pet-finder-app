import '../../../../core/api/api_result.dart';
import '../../../../core/error/network_exceptions.dart';
import '../api_services/home_api_services.dart';
import '../models/bird_model.dart';

class HomeRepo {
  final HomeWebServices homeWebServices;

  HomeRepo(this.homeWebServices);

  Future<ApiResult<List<BirdModel>>> getAllBirds() async {
    try {
      final response = await homeWebServices.getAllBirds();
      return ApiResult.success(response);
    } catch (error) {
      final exception = NetworkExceptions.getDioException(error);
      final message = NetworkExceptions.getErrorMessage(exception);
      return ApiResult.failure(message, error: exception);
    }
  }
}
