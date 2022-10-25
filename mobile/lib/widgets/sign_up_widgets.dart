import 'package:escrow_mobile/bloc/blocs/auth_bloc.dart';
import 'package:escrow_mobile/bloc/events/auth_actions.dart';
import 'package:escrow_mobile/bloc/events/snack_bar_actions.dart';
import 'package:escrow_mobile/utils/contstants.dart';
import 'package:escrow_mobile/widgets/common/dialogs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();

class UserNameField extends StatelessWidget {
  const UserNameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(10),
        child: TextFormField(
            controller: username,
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'username is required';
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: Constants.appColor),
              contentPadding: const EdgeInsets.only(left: 5.0),
              border: InputBorder.none,
              hintText: 'Username'.toLowerCase(),
              labelText: 'Username',
              hintStyle: Constants.formTextStyle(),
              labelStyle: Constants.formTextStyle(),
              prefixIcon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const Icon(
                  Icons.verified_user,
                  color: Constants.appColor,
                ),
              ),
            )));
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.all(10),
        child: TextFormField(
            controller: password,
            keyboardType: TextInputType.text,
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'password is required';
              } else if (value.length < 5) {
                return 'password should be at least 5 characters';
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: const TextStyle(color: Constants.appColor),
              contentPadding: const EdgeInsets.only(left: 5.0),
              border: InputBorder.none,
              hintText: 'Password'.toLowerCase(),
              labelText: 'Password',
              hintStyle: Constants.formTextStyle(),
              labelStyle: Constants.formTextStyle(),
              prefixIcon: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const Icon(
                  Icons.lock,
                  color: Constants.appColor,
                ),
              ),
            )));
  }
}

class SignUpBtn extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SignUpBtn({Key? key, required this.formKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 3),
        child: Center(
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(0),
                    fixedSize: MaterialStateProperty.all(const Size(300, 30)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                            side: const BorderSide(color: Colors.white)))),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AuthBloc bloc = BlocProvider.of<AuthBloc>(context);
                    bloc.add(Login(username: username, password: password));
                  } else {
                    snackBar(
                        message: Constants.invalidFormMessage,
                        action: SnackBarActions.error);
                  }
                },
                child: const Text(
                  'Log In',
                  style: TextStyle(
                      fontSize: 10,
                      color: Constants.appColor,
                      fontWeight: FontWeight.bold),
                ))));
  }
}

class RoutingText extends StatelessWidget {
  final String text;
  final String route;
  final AlignmentGeometry alignment;

  const RoutingText(
      {Key? key,
      required this.text,
      required this.route,
      required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: GestureDetector(
          onTap: () => Get.toNamed(route),
          child: Align(
              alignment: alignment,
              child: Text(text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.normal))))
    );
  }
}
