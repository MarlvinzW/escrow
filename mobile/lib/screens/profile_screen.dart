import 'package:escrow_mobile/bloc/blocs/auth_bloc.dart';
import 'package:escrow_mobile/utils/contstants.dart';
import 'package:escrow_mobile/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // auth bloc
  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text('Profile',
                style: TextStyle(color: Constants.appColor)),
            actions: const [LogOutBtn()]),
        body: ListView(children: [
          // first name
          ProfileItem(
              text: authBloc.state.auth!.firstName, heading: 'First Name'),
          // last name
          ProfileItem(
              text: authBloc.state.auth!.lastName, heading: 'Last Name'),
          // email
          ProfileItem(text: authBloc.state.auth!.email, heading: 'Email'),
          // province
          ProfileItem(
              text: authBloc.state.auth!.location.province,
              heading: 'Province'),
          // city
          ProfileItem(
              text: authBloc.state.auth!.location.city, heading: 'City'),
          // address
          ProfileItem(
              text: authBloc.state.auth!.location.address, heading: 'Address')
        ]));
  }
}
