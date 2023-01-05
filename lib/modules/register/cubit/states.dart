abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class CreateUserSuccessState extends RegisterStates {
  final String uId;
  CreateUserSuccessState(this.uId);
}

class CreateUserErrorState extends RegisterStates {}

class RegisterChangePasswordVisibilityState extends RegisterStates {}