/*
    @author Marlvin Chihota
    Email marlvinchihota@gmail.com
    Created on 9/4/2022
*/

import 'dart:async';

import 'package:escrow_mobile/bloc/events/auth_actions.dart';
import 'package:escrow_mobile/bloc/events/snack_bar_actions.dart';
import 'package:escrow_mobile/models/payload/location_dto.dart';
import 'package:escrow_mobile/models/payload/login_dto.dart';
import 'package:escrow_mobile/models/payload/user_dto.dart';
import 'package:escrow_mobile/models/repositories/auth_repository.dart';
import 'package:escrow_mobile/models/response/api_response.dart';
import 'package:escrow_mobile/models/response/auth.dart';
import 'package:escrow_mobile/models/response/auth_response.dart';
import 'package:escrow_mobile/services/impl/user_api_impl.dart';
import 'package:escrow_mobile/utils/routes.dart';
import 'package:escrow_mobile/widgets/common/dialogs.dart';
import 'package:get/get.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class AuthBloc extends HydratedBloc<AuthActions, AuthRepository> {
  // api service
  final service = UserApiImpl();

  AuthBloc() : super(AuthRepository(isAuthenticated: false)) {
    on<Loading>(_onLoading);

    on<Login>(_onLogin);

    on<LoggedOut>(_onLoggedOut);

    on<Register>(_onRegister);
  }

  Future<FutureOr<void>> _onLoading(
      Loading event, Emitter<AuthRepository> emit) async {
    // return authentication state
    emit(
        state.isAuthenticated ? state : AuthRepository(isAuthenticated: false));
  }

  Future<FutureOr<void>> _onLogin(
      Login event, Emitter<AuthRepository> emit) async {
    // connect with API
    AuthResponse? response = await service.login(
        LoginDto(username: event.username.text, password: event.password.text));

    // clear password field
    event.password.clear();

    if (response != null) {
      // route
      Get.offAllNamed(Routes.profileScreen);
      snackBar(
          message: 'Welcome ${response.user.username}',
          action: SnackBarActions.success);
      // emit auth state
      emit((AuthRepository(isAuthenticated: true, auth: response.user)));
    } else {
      // emit unauthenticated state
      emit((AuthRepository(isAuthenticated: false)));
    }
  }

  Future<FutureOr<void>> _onLoggedOut(
      LoggedOut event, Emitter<AuthRepository> emit) async {
    // route
    Get.offAllNamed(Routes.signInScreen);
    Auth user = state.auth!;
    snackBar(
        message: 'Goodbye ${user.username}', action: SnackBarActions.success);

    emit(AuthRepository(isAuthenticated: false));
  }

  Future<FutureOr<void>> _onRegister(
      Register event, Emitter<AuthRepository> emit) async {
    // connect with API
    ApiResponse? response = await service.register(UserDto(
        username: event.username.text,
        firstName: event.firstName.text,
        lastName: event.lastName.text,
        password: event.password.text,
        location: LocationDto(
            address: event.address.text,
            city: event.city.text,
            province: event.province.text)));

    if (response != null) {
      Get.offAllNamed(Routes.signInScreen);
      // success message
      snackBar(message: response.data, action: SnackBarActions.success);
    } else {
      // clear passwords
      event.password.clear();
      event.confirmPassword.clear();
    }

    // emit unauthenticated state
    emit((AuthRepository(isAuthenticated: false)));
  }

  @override
  AuthRepository? fromJson(Map<String, dynamic> json) =>
      AuthRepository.fromJson(json['value']);

  @override
  Map<String, dynamic>? toJson(AuthRepository state) =>
      {'value': state.toJson()};
}
