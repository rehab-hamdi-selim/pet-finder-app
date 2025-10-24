import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../models/bird_model.dart';

part 'home_api_services.g.dart';

@RestApi(baseUrl: 'https://api.thecatapi.com/v1/')
abstract class HomeWebServices {
  static Dio createAndSetUpDio() {
    final dio = Dio();

    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'x-api-key':
            'live_4HNK7udyg3Ou8un9oCLYZ6jezH5fVQ7w4wBB06C7u2z4hjr6agoIq3ZkLh8c2DsF',
      },
    );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        error: true,
        responseBody: true,
        request: true,
      ),
    );

    return dio;
  }

  factory HomeWebServices(Dio dio, {String? baseUrl}) = _HomeWebServices;

  @GET('breeds')
  Future<List<BirdModel>> getAllBirds();
}
