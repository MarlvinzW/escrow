import 'package:escrow_mobile/bloc/blocs/auth_bloc.dart';
import 'package:escrow_mobile/bloc/events/auth_actions.dart';
import 'package:escrow_mobile/models/repositories/auth_repository.dart';
import 'package:escrow_mobile/screens/profile_screen.dart';
import 'package:escrow_mobile/screens/sign_in_screen.dart';
import 'package:escrow_mobile/screens/sign_up_screen.dart';
import 'package:escrow_mobile/utils/contstants.dart';
import 'package:escrow_mobile/utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:hydrated_bloc/hydrated_bloc.dart' as hydrated_bloc;
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  // initialization
  WidgetsFlutterBinding.ensureInitialized();
  //  orientation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  /* Hydrated Bloc Initialization */
  final storage = await hydrated_bloc.HydratedStorage.build(
    storageDirectory: kIsWeb
        ? hydrated_bloc.HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  // bloc initialization
  hydrated_bloc.HydratedBlocOverrides.runZoned(
    () => runApp(bloc.BlocProvider<AuthBloc>(
        create: (context) {
          return AuthBloc()..add(Loading());
        },
        child: const App())),
    storage: storage,
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(child: bloc.BlocBuilder<AuthBloc, AuthRepository>(
      builder: (context, state) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: Constants.appName,
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            initialRoute: state.isAuthenticated
                ? Routes.profileScreen
                : Routes.signInScreen,
            getPages: [
              GetPage(
                  name: Routes.profileScreen,
                  page: () => const ProfileScreen()),
              GetPage(
                  name: Routes.signInScreen, page: () => const SignInScreen()),
              GetPage(
                  name: Routes.signUpScreen, page: () => const SignUpScreen()),
            ],
            transitionDuration:
                const Duration(milliseconds: Constants.transitionDelay),
            defaultTransition: Transition.zoom);
      },
    ));
  }
}
