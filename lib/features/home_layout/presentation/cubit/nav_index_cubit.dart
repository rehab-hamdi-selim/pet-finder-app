import 'package:flutter_bloc/flutter_bloc.dart';
import 'nav_index_state.dart';

class NavIndexCubit extends Cubit<NavIndexState> {
  NavIndexCubit() : super(const NavIndexState(0));

  void changeIndex(int newIndex) {
    emit(NavIndexState(newIndex));
  }
}
