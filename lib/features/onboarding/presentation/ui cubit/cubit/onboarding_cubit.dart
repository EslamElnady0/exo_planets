import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  int currentIndex = 0;

  void changeIndex(int newIndex) {
    currentIndex = newIndex;
    emit(OnboardingChange());
  }
}
