import 'package:escrow_mobile/utils/contstants.dart';
import 'package:escrow_mobile/utils/routes.dart';
import 'package:escrow_mobile/widgets/sign_up_widgets.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  void initState() {
    // clear form fields
    username.clear();
    password.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // form key
    GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Login', style: TextStyle(color: Constants.appColor)),
      ),
      body: Form(
          key: signInFormKey,
          child: ListView(children: [
            const UserNameField(),
            const PasswordField(),
            SignUpBtn(formKey: signInFormKey),
            const RoutingText(
                text: "Don't have an account ? Sign up",
                route: Routes.signUpScreen,
                alignment: Alignment.center)
          ])),
    );
  }
}
