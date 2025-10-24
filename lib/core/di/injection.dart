import 'package:get_it/get_it.dart';
import 'package:pet_finder_app/features/home/data/api_services/home_api_services.dart';
import 'package:pet_finder_app/features/home/data/repo/home_repo.dart';
import 'package:pet_finder_app/features/home/presentation/cubit/home_cubit.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<HomeWebServices>(
    () => HomeWebServices(HomeWebServices.createAndSetUpDio()),
  );
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt()));
}
