import 'package:escrow_mobile/bloc/blocs/auth_bloc.dart';
import 'package:escrow_mobile/bloc/events/auth_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileItem extends StatelessWidget {
  final String text;
  final String heading;

  const ProfileItem({Key? key, required this.text, required this.heading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: ListTile(
        title: Text(text),
        subtitle: Text(heading),
      )
    );
  }
}

class LogOutBtn extends StatelessWidget {
  const LogOutBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return IconButton(
        onPressed: () => authBloc.add(LoggedOut()),
        icon: const Icon(
          Icons.exit_to_app,
          color: Colors.red,
        ));
  }
}
