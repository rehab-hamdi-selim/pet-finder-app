import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  Future<void> getAllBirds() async {
    emit(const HomeState.loading());

    final result = await _homeRepo.getAllBirds();

    if (result.isSuccess && result.data != null) {
      emit(HomeState.loaded(result.data!));
    } else {
      emit(HomeState.error(result.message ?? 'Unknown Error'));
    }
  }
}
